import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/functions_page_data_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FunctionsPage extends StatefulWidget {
  final FunctionsPageDataModel functionsPageDataModel;
  const FunctionsPage({
    super.key,
    required this.functionsPageDataModel,
  });

  @override
  State<FunctionsPage> createState() => _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // get youtube video id from url, when open the page
    final videoId =
        YoutubePlayer.convertUrlToId(widget.functionsPageDataModel.url) ?? "";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.functionsPageDataModel.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Youtube player
                if (_controller.initialVideoId.isNotEmpty)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  )
                else
                  const Text("No video available!"),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Duration : ${widget.functionsPageDataModel.duration} min",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGrey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Category : ${widget.functionsPageDataModel.category}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.functionsPageDataModel.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryDarkBlue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
