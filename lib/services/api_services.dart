import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_api/models/video_model.dart';
import 'package:youtube_api/utils/constant.dart';

class ApiService   {
  Future<List<VideoModel>> getVideos() async{
    List<VideoModel> videosModels =[];
    String url = '$baseUrl/search?part=snippet&key=$APiKey&maxResults=50&regionCode=AR';

    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap['items'];
      videosModels = videos.map((e) => VideoModel.fromJson(e)).toList();
      print(videosModels);
      return videosModels;
    }
    return videosModels;
  }
}
