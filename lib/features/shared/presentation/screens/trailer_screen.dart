import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/youtube_trailer_player.dart';

@RoutePage()
class TrailerScreen extends StatelessWidget {
  const TrailerScreen({super.key, required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context) {
    return YouTubeTrailerPlayer(videoId: videoId);
  }
}
