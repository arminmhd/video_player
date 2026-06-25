import 'package:equatable/equatable.dart';

enum PlayerStatus { initial, loading, ready, error }

class PlayerState extends Equatable {
  final PlayerStatus status;
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final double volume;
  final double playbackSpeed;
  final String quality;
  final String? message;

  const PlayerState({
    required this.status,
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.volume,
    required this.playbackSpeed,
    required this.quality,
    this.message,
  });

  factory PlayerState.initial() {
    return const PlayerState(
      status: PlayerStatus.initial,
      position: Duration.zero,
      duration: Duration.zero,
      isPlaying: false,
      volume: 1.0,
      playbackSpeed: 1.0,
      quality: 'Auto',
      message: null,
    );
  }

  PlayerState copyWith({
    PlayerStatus? status,
    Duration? position,
    Duration? duration,
    bool? isPlaying,
    double? volume,
    double? playbackSpeed,
    String? quality,
    String? message,
  }) {
    return PlayerState(
      status: status ?? this.status,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
      volume: volume ?? this.volume,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      quality: quality ?? this.quality,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    status,
    position,
    duration,
    isPlaying,
    volume,
    playbackSpeed,
    quality,
    message,
  ];
}
