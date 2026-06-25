import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';
import '../bloc/player_event.dart';
import '../bloc/player_state.dart';

import '../widgets/player_video.dart';
import '../widgets/player_controls.dart';
import '../widgets/player_progress_bar.dart';
import '../widgets/player_settings.dart';

class PlayerView extends StatefulWidget {
  final String url;

  const PlayerView({super.key, required this.url});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(PlayerInitialized(widget.url));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  Future<void> _toggleFullScreen() async {
    setState(() {
      isFullScreen = !isFullScreen;
    });

    if (isFullScreen) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayerBloc>();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state.status == PlayerStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == PlayerStatus.error) {
              return Center(
                child: Text(state.message ?? 'Something went wrong'),
              );
            }

            final controller = bloc.controller;

            if (controller == null || !controller.value.isInitialized) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: PlayerVideo(controller: controller),
                    ),
                  ),

                  const SizedBox(height: 16),

                  PlayerProgressBar(
                    progress: state.duration.inSeconds == 0
                        ? 0
                        : state.position.inSeconds / state.duration.inSeconds,
                    currentTime: _format(state.position),
                    totalTime: _format(state.duration),
                    onSeek: (value) {
                      final position = Duration(
                        seconds: (value * state.duration.inSeconds).toInt(),
                      );

                      bloc.controller?.seekTo(position);
                    },
                  ),

                  const SizedBox(height: 16),

                  PlayerControls(
                    isPlaying: state.isPlaying,
                    onPlayPause: () {
                      bloc.add(PlayerPlayPausePressed());
                    },
                    onForward10: () {
                      bloc.add(PlayerForwardPressed());
                    },
                    onBackward10: () {
                      bloc.add(PlayerBackwardPressed());
                    },
                    onFullScreen: _toggleFullScreen,
                    onVolumePressed: () {},
                  ),

                  const SizedBox(height: 24),

                  PlayerSettings(
                    quality: state.quality,
                    playbackSpeed: state.playbackSpeed,

                    onQualityTap: () {
                      _showQualitySheet(context);
                    },

                    onSpeedTap: () {
                      _showSpeedSheet(context);
                    },

                    onWatchlistTap: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _format(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  void _showSpeedSheet(BuildContext context) {
    final bloc = context.read<PlayerBloc>();

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('0.5x'),
              onTap: () {
                bloc.add(const PlayerPlaybackSpeedChanged(0.5));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('1.0x'),
              onTap: () {
                bloc.add(const PlayerPlaybackSpeedChanged(1.0));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('1.5x'),
              onTap: () {
                bloc.add(const PlayerPlaybackSpeedChanged(1.5));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('2.0x'),
              onTap: () {
                bloc.add(const PlayerPlaybackSpeedChanged(2.0));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showQualitySheet(BuildContext context) {
    final bloc = context.read<PlayerBloc>();

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('480p'),
              onTap: () {
                bloc.add(const PlayerQualityChanged('480p'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('720p'),
              onTap: () {
                bloc.add(const PlayerQualityChanged('720p'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('1080p'),
              onTap: () {
                bloc.add(const PlayerQualityChanged('1080p'));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
