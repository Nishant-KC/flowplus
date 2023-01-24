import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/controllers/business_category_controller.dart';
import 'package:flow_plus/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/models/business_details_model.dart';
import '../../widgets/_common/two_state_button.dart';
import '../../widgets/campaign_video_widget.dart';

class UserCampaignCommercialFeed extends StatelessWidget {
  final Map businessCategory;
  final businesCategoryController = Get.put(BusinessCategoryController());
  UserCampaignCommercialFeed({Key? key, required this.businessCategory})
      : super(key: key) {
    businesCategoryController.addOrRemoveCategory(businessCategory);
  }

  @override
  Widget build(BuildContext context) {
    final List<BusinessDetailsModel> businesses =
        Provider.of<List<BusinessDetailsModel>>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text(
                            'Select Filters:',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    TwoStateButton(),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(CollectionDBs.videosCollection)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return const Text("There is an error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Text("No Videos Found");
                    } else {
                      List<VideoModel> videos = snapshot.data!.docs
                          .map((e) => VideoModel.fromJson(e))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: videos.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Color(0xffeff7fe)),
                              child: CampaignVideoWidget(
                                videoModel: videos[index],
                                showEmail: true,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),

              // Expanded(
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       physics: const ClampingScrollPhysics(),
              //       itemCount: 10,
              //       itemBuilder: (BuildContext context, int index) {
              //         return const CampaignVideoWidget();
              //       }),
              // )
            ],
          ),
        ));
  }
}
