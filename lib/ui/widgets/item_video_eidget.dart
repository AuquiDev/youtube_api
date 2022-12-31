import 'package:flutter/material.dart';
import 'package:youtube_api/models/video_model.dart';
import 'package:youtube_api/pages/video_detail_page.dart';

class ItemVideoWidget extends StatelessWidget {
   ItemVideoWidget({super.key,required this.model});
  VideoModel model;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoDetailPage(videoId: model.id.videoId,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  '${model.snippet.thumbnails.high.url}',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * .4,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(.7),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    child: Text(
                      '23:45',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: Colors.white12,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/foto-gratis/retrato-joven-sonriente-gafas_171337-4842.jpg?w=2000'),
              ),
              title:  Text(
                '${model.snippet.title}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              subtitle: Text(
                '${model.snippet.channelTitle} . 6.5 M de vistas . hace 2 años',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
