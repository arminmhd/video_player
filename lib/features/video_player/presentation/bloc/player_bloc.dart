import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'player_event.dart';
import 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  VideoPlayerController? controller;

  PlayerBloc() : super(PlayerState.initial()) {
    on<PlayerInitialized>(_onInit);
    on<PlayerPlayPausePressed>(_onPlayPause);
    on<PlayerForwardPressed>(_onForward);
    on<PlayerBackwardPressed>(_onBackward);
    on<PlayerVolumeChanged>(_onVolume);
    on<PlayerTicked>(_onTick);
  }

  Future<void> _onInit(
    PlayerInitialized event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(status: PlayerStatus.loading));

    try {
      controller = VideoPlayerController.networkUrl(Uri.parse(event.url));

      await controller!.initialize();

      controller!.addListener(_listener);

      emit(
        state.copyWith(
          status: PlayerStatus.ready,
          duration: controller!.value.duration,
        ),
      );

      await controller!.play();
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error, message: e.toString()));
    }
  }

  void _listener() {
    if (controller == null) return;

    add(
      PlayerTicked(
        position: controller!.value.position,
        isPlaying: controller!.value.isPlaying,
      ),
    );
  }

  void _onTick(PlayerTicked event, Emitter<PlayerState> emit) {
    emit(state.copyWith(position: event.position, isPlaying: event.isPlaying));
  }

  Future<void> _onPlayPause(
    PlayerPlayPausePressed event,
    Emitter<PlayerState> emit,
  ) async {
    if (controller == null) return;

    if (controller!.value.isPlaying) {
      await controller!.pause();
    } else {
      await controller!.play();
    }

    emit(state.copyWith(isPlaying: controller!.value.isPlaying));
  }

  Future<void> _onForward(
    PlayerForwardPressed event,
    Emitter<PlayerState> emit,
  ) async {
    final newPos = controller!.value.position + const Duration(seconds: 10);

    await controller!.seekTo(newPos);
  }

  Future<void> _onBackward(
    PlayerBackwardPressed event,
    Emitter<PlayerState> emit,
  ) async {
    final newPos = controller!.value.position - const Duration(seconds: 10);

    await controller!.seekTo(newPos < Duration.zero ? Duration.zero : newPos);
  }

  Future<void> _onVolume(
    PlayerVolumeChanged event,
    Emitter<PlayerState> emit,
  ) async {
    await controller!.setVolume(event.volume);

    emit(state.copyWith(volume: event.volume));
  }

  @override
  Future<void> close() {
    controller?.removeListener(_listener);
    controller?.dispose();
    return super.close();
  }
}
