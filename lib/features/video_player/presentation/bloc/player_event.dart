import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class PlayerInitialized extends PlayerEvent {
  final String url;
  const PlayerInitialized(this.url);

  @override
  List<Object?> get props => [url];
}

class PlayerPlayPausePressed extends PlayerEvent {}

class PlayerForwardPressed extends PlayerEvent {}

class PlayerBackwardPressed extends PlayerEvent {}

class PlayerVolumeChanged extends PlayerEvent {
  final double volume;
  const PlayerVolumeChanged(this.volume);

  @override
  List<Object?> get props => [volume];
}

class PlayerTicked extends PlayerEvent {
  final Duration position;
  final bool isPlaying;

  const PlayerTicked({required this.position, required this.isPlaying});

  @override
  List<Object?> get props => [position, isPlaying];
}
