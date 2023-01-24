import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../screens/user_screens/user_campaign_commercial_feed.dart';

class SnapInCards extends StatefulWidget {
  const SnapInCards({Key? key}) : super(key: key);

  @override
  _SnapInCardsState createState() => _SnapInCardsState();
}

class _SnapInCardsState extends State<SnapInCards> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final businessCategories = Provider.of<List<Map>>(context);
    return Center(
      child: SizedBox(
        height: 280, // card height
        child: PageView.builder(
          itemCount: businessCategories.length,
          controller: PageController(viewportFraction: 0.7),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.9,
              child: Stack(
                children: [
                  InkWell(
                    onLongPress: () {
                      Get.to(
                        () => UserCampaignCommercialFeed(
                          businessCategory: businessCategories[i],
                        ),
                      );
                    },
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(bounds);
                      },
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          height: 260,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                              imageUrl: businessCategories[i]
                                      ['category_image'] ??
                                  'https://via.placeholder.com/300?text=DITTO',
                              errorWidget: (context, name, e) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              },
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      businessCategories[i]['category_name'] ?? "",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
