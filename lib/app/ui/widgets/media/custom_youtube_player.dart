import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYouTubePlayer extends StatelessWidget {
  const CustomYouTubePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    String? videoId = Get.arguments as String?;

    assert(videoId != null, "Must pass video id");

    final controller = YoutubePlayerController.fromVideoId(
      videoId: "$videoId",
      autoPlay: true,
      params: const YoutubePlayerParams(
        showVideoAnnotations: true,
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        playsInline: true,
      ),
    );
    return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    );
  }
}
