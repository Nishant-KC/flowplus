import 'package:flow_plus/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../data/models/business_details_model.dart';

class CampaignVideoWidget extends StatefulWidget {
  // final String? videoLink;
  final VideoModel? videoModel;
  final bool showEmail;
  const CampaignVideoWidget({
    Key? key,
    // this.videoLink,
    this.videoModel,
    this.showEmail = false,
  }) : super(key: key);

  @override
  State<CampaignVideoWidget> createState() => _CampaignVideoWidgetState();
}

class _CampaignVideoWidgetState extends State<CampaignVideoWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    get();
  }

  get() {
    try {
      _videoPlayerController = VideoPlayerController.network(
        widget.videoModel?.link ??
            'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4',
      )..initialize().then((_) {
          setState(() {});
          // _videoPlayerController.play();
        });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<List<BusinessDetailsModel>>(context);
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                //report campaign
                child: Icon(Icons.more_horiz),
              ),
            ],
          ),
          _videoPlayerController.value.isInitialized
              ? Stack(
                  alignment: Alignment.topRight,
                  children: [
                    AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                    InkWell(
                      onTap: () {
                        _videoPlayerController.value.isPlaying
                            ? _videoPlayerController.pause()
                            : _videoPlayerController.play();
                        setState(() {});
                      },
                      child: Icon(
                        _videoPlayerController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                  ],
                )
              : const SizedBox(
                  height: 100,
                ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        //Join a campaign
                        Icon(Icons.join_full),
                        //Explore campaign details
                        Icon(Icons.data_exploration),
                        //share campaign
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        //bookmark campaign
                        Icon(Icons.bookmark_border),
                  ),
                  //Icon(Icons.bookmark),
                ],
              ),
              widget.showEmail
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Business :'),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              widget.videoModel?.email ?? "",
                              style: const TextStyle(color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Text(
                          DateFormat('MM/dd/yy hh:mm a').format(
                              widget.videoModel?.time ?? DateTime.now()),
                          style: Theme.of(context).textTheme.bodySmall,
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
