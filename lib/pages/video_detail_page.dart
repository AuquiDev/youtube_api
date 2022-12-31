import 'package:flutter/material.dart';
import 'package:youtube_api/ui/general/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  VideoDetailPage({super.key,required this.videoId});
  String videoId;
  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {

 late YoutubePlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = YoutubePlayerController(
      initialVideoId: widget.videoId,//'DkeiKbqa02g',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
        
      )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbranprimarycolor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.35,
            child: YoutubePlayer(
              controller: _playerController,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                backgroundColor: Colors.redAccent,
                handleColor: Colors.red,
                bufferedColor: Colors.greenAccent
              ),
              ),
          )
        ],
      ),
    );
  }
}