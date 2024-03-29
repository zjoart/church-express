import 'dart:convert';
import 'package:churchexpress/src/helpers/images.dart';

import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/models/videomodels/videos/LiveVideo.dart';
import 'package:churchexpress/src/models/videomodels/videos/channel_model.dart';
import 'package:churchexpress/src/models/videomodels/videos/live_video_model.dart';
import 'package:churchexpress/src/models/videomodels/videos/video_model.dart';
import 'package:churchexpress/src/viewmodels/api_service.dart';
import 'package:churchexpress/src/views/Livestream/video_page.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  ChannelModel _channel;
  bool _isLoading = false;
  // ignore: unused_field
  List<LiveVideo> _liveVideos;

  Future<LiveVideoModel> theVideos;

  int _noOfVids;

  @override
  void initState() {
    super.initState();
    _initChannel();

//    fetchLiveVideos();

    theVideos = fetchTheVids();
    theVideos.then((val){
      _noOfVids = val.items.length;
      print(_noOfVids);
      print(val.items[0].id.videoId);
      print(val.items[0].snippet.channelTitle);
    });
  }

  Future<LiveVideoModel> fetchTheVids() async {
    http.Response response = await http.get(
        'https://www.googleapis.com/youtube/v3/search?key=AIzaSyCFWKRQli9kGclT16QmfdTajZnSdEgoys8&channelId=UCNye-wNBqNL5ZzHSJj3l8Bg&part=snippet,id&eventType=live&type=video');

    if (response.statusCode == 200) {
      print(response.toString());
      return LiveVideoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting vids");
    }
  }

  fetchLiveVideos() async {
    List<LiveVideo> videos = await APIService.instance.fetchLiveVideos(channelId: "UCeY0bbntWzzVIaj2z3QigXg");
    print(videos[0].id);

    setState(() {
      _liveVideos = videos;
      _noOfVids = videos.length;
    });
  }

  _initChannel() async {
    ChannelModel channel = await APIService.instance
        .fetchChannel(channelId: 'UCeY0bbntWzzVIaj2z3QigXg');
    setState(() {
      _channel = channel;
    });
  }

  // ignore: unused_element
  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
//            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(VideoModel video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoPage(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        padding: EdgeInsets.all(10.0),
        height: 90.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: 70.0,
                height: 55.0,
                image: NetworkImage(video.thumbnailUrl),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 3.0,),
                    Text(
                      video.title,
                      style: nstyle.copyWith(fontSize: 11.0, color: Color(0xFF000000), fontWeight: FontWeight.w700, letterSpacing: 1.3),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                    SizedBox(height: 3,),
                    Text(
                      video.description,
                      style:nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000), fontWeight: FontWeight.w400),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                    SizedBox(height: 3,),
                    Text(
                      video.publishedAt.split("T")[0],
                      style:nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000).withOpacity(0.4), fontWeight: FontWeight.w400)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _buildLiveVideo(Items items) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoPage(id: items.id.videoId),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: 70.0,
                height: 55.0,
                image: NetworkImage(items.snippet.thumbnails.defaults.url),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 3.0,),
                  Text(
                      items.snippet.title,
                      style: nstyle.copyWith(fontSize: 11.0, color: Color(0xFF000000), fontWeight: FontWeight.w700, letterSpacing: 1.3),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                  SizedBox(height: 3,),
                  Text(
                      items.snippet.description,
                      style:nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000), fontWeight: FontWeight.w400),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                  SizedBox(height: 3,),
                  Text(
                    items.snippet.publishedAt.split("T")[0],
                    style: nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000).withOpacity(0.4), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            CircleAvatar(backgroundColor: Colors.red, radius: 4.0,),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<VideoModel> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<VideoModel> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _globalKey,
        drawer: LoginDrawer(),
        appBar: appBar('Video', () {
                _globalKey.currentState.openDrawer();
              }, context),
        body: Column(
          children: <Widget>[
            Container(
               child: Image.asset(banner),),
            _noOfVids == 0 ? SizedBox.shrink() :
            FutureBuilder(
                future: theVideos,
                builder: (BuildContext context, AsyncSnapshot<LiveVideoModel> snapshot) {
                  if(snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: Container(
                        height: 70.0,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.items.length,
                            itemBuilder: (context, index) {
                              Items item = snapshot.data.items[index];
                              return _buildLiveVideo(item);
                            }),
                      ),
                    );
                  } else {
                    return Container(height: 0.0, width: 0.0,);
                  }
                }),

            _channel != null ? NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollDetails) {
                  if (!_isLoading &&
                      _channel.videos.length != int.parse(_channel.videoCount) &&
                      scrollDetails.metrics.pixels ==
                          scrollDetails.metrics.maxScrollExtent) {
                    print(_channel.videos[0].channelTitle);
                    _loadMoreVideos();
                  }
                  return false;
                }, child: Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 1 + _channel.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return SizedBox.shrink();
                    }
                    VideoModel video = _channel.videos[index - 1];
                    return _buildVideo(video);
                  },
                ),
              ),
            )
            ) : Expanded(
              flex: 8,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                   blueblack, // Red
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Future<bool> _onWillPop() {
    return  Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) => HomeScreen(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return new FadeTransition(
                  opacity: animation, child: child);
            }));
  }

}