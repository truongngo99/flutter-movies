import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerDetailSCreen extends StatefulWidget {
  final String keyYoutube;
  final String title;
  TrailerDetailSCreen({Key? key, required this.keyYoutube, required this.title})
      : super(key: key);

  @override
  _TrailerDetailSCreenState createState() => _TrailerDetailSCreenState();
}

class _TrailerDetailSCreenState extends State<TrailerDetailSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Trailer ${widget.title}'),
      ),
      body: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: widget.keyYoutube,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: true,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
