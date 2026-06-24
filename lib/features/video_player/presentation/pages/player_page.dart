import 'package:flutter/material.dart';
import 'package:movie_stream_app/features/video_player/presentation/pages/player_view.dart';

class PlayerPage extends StatefulWidget {
  final String url;

  const PlayerPage({super.key, required this.url});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return PlayerView(url: widget.url);
  }
}
