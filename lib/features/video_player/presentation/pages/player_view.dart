import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';
import '../bloc/player_event.dart';
import '../bloc/player_state.dart';

import '../widgets/player_video.dart';
import '../widgets/player_controls.dart';
import '../widgets/player_progress_bar.dart';
import '../widgets/player_volume_slider.dart';
import '../widgets/player_settings.dart';

class PlayerView extends StatefulWidget {
  final String url;

  const PlayerView({super.key, required this.url});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  bool showControls = true;
  bool isFullScreen = false;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(PlayerInitialized(widget.url));
    _startHideControlsTimer();
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    if (isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          showControls = false;
        });
      }
    });
  }

  void toggleControls() {
    setState(() {
      showControls = !showControls;
    });
    if (showControls) {
      _startHideControlsTimer();
    }
  }

  Future<void> _toggleFullScreen() async {
    setState(() {
      isFullScreen = !isFullScreen;
    });

    if (isFullScreen) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  void openSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (_) => PlayerSettings(
        onQualityTap: () {},
        onCaptionTap: () {},
        onSpeedTap: () {},
        onWatchlistTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayerBloc>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state.status == PlayerStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == PlayerStatus.error) {
            return Center(
              child: Text(
                state.message ?? "Error",
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          final controller = bloc.controller;

          if (controller == null || !controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          return GestureDetector(
            onTap: toggleControls,
            child: Stack(
              children: [
                Center(child: PlayerVideo(controller: controller)),

                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.35),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Text(
                              'Now Playing',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(
                                isFullScreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                              ),
                              onPressed: _toggleFullScreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                if (showControls)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.72),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PlayerProgressBar(
                            progress: state.duration.inSeconds == 0
                                ? 0
                                : state.position.inSeconds /
                                      state.duration.inSeconds,
                            currentTime: _format(state.position),
                            totalTime: _format(state.duration),
                            onSeek: (value) {
                              final pos = Duration(
                                seconds: (value * state.duration.inSeconds)
                                    .toInt(),
                              );
                              bloc.controller?.seekTo(pos);
                            },
                          ),

                          const SizedBox(height: 12),

                          PlayerControls(
                            isPlaying: state.isPlaying,
                            onPlayPause: () =>
                                bloc.add(PlayerPlayPausePressed()),
                            onForward10: () => bloc.add(PlayerForwardPressed()),
                            onBackward10: () =>
                                bloc.add(PlayerBackwardPressed()),
                            onFullScreen: _toggleFullScreen,
                          ),

                          const SizedBox(height: 12),

                          PlayerVolumeSlider(
                            value: state.volume,
                            onChanged: (value) {
                              bloc.add(PlayerVolumeChanged(value));
                            },
                          ),

                          const SizedBox(height: 12),

                          IconButton(
                            onPressed: () => openSettings(context),
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _format(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$m:$s";
  }
}
