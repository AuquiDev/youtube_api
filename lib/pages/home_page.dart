import 'package:flutter/material.dart';
import 'package:youtube_api/models/video_model.dart';
import 'package:youtube_api/services/api_services.dart';
import 'package:youtube_api/ui/general/colors.dart';
import 'package:youtube_api/ui/widgets/item_filter_widget.dart';
import 'package:youtube_api/ui/widgets/item_video_eidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiservices = ApiService();

  List<VideoModel> videos = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    _apiservices.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _apiservices.getVideos();
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.explore_outlined),
                  label: const Text('Explorar'),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: kbranSecondarycolor,
                      padding: const EdgeInsets.symmetric(horizontal: 10)),
                ),
                const SizedBox(
                  height: 33,
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                ItemFilterWidget(
                  text: 'Todos',
                  isSelect: true,
                ),
                ItemFilterWidget(
                  text: 'Mixes',
                  isSelect: false,
                ),
                ItemFilterWidget(
                  text: 'Musica',
                  isSelect: false,
                ),
                ItemFilterWidget(
                  text: 'Programacion',
                  isSelect: false,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
              itemCount: videos.length, 
              itemBuilder: (context, index) {
                return ItemVideoWidget(model: videos[index],);
              })
        ],
      ),
    ));
  }
}
