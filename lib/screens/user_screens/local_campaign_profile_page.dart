import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/controllers/local_campaign_controller.dart';
import 'package:flow_plus/data/models/video_model.dart';
import 'package:flow_plus/widgets/campaign_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/screens/user_screens/user_purchase_voucher_page.dart';
import 'package:intl/intl.dart';

import '../messages/user_to_business_chat_screen.dart';

class LocalCampaignProfilePage extends GetView<LocalCampaignController> {
  late LocalCampaignController localCampaignController;
  final BusinessDetailsModel businessDetailsModel;
  LocalCampaignProfilePage({
    Key? key,
    required this.businessDetailsModel,
  }) : super(key: key) {
    localCampaignController = Get.put(
        LocalCampaignController(businessDetailsModel: businessDetailsModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Campaign Page"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => UserToBusinessChatScreen(
                  businessDetailsModel: businessDetailsModel,
                ),
              );
            },
            icon: const Icon(Icons.chat),
          )
        ],
        titleSpacing: 8,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Get.to(() => const PurchaseVoucher());
        },
        child: const Icon(
          Icons.join_full,
          color: Colors.black45,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      businessDetailsModel.businessName!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ),
            ),
            Obx(
              () => localCampaignController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 250,
                              //color: Colors.blueGrey.shade100,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: SizedBox(
                            width: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Start Date:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Text(
                                            DateFormat('dd/MM/yyyy').format(
                                                localCampaignController
                                                        .campaignDetailsModel
                                                        ?.campaignStartDate ??
                                                    DateTime.now()),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'End Date:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Text(
                                            DateFormat('dd/MM/yyyy').format(
                                                localCampaignController
                                                        .campaignDetailsModel
                                                        ?.campaignEndTime ??
                                                    DateTime.now()),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Goal:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        "\$${localCampaignController.campaignDetailsModel?.campaignTarget}",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Reached:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        "\$${localCampaignController.campaignDetailsModel?.campaignPurchasedByUser}",
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Goal Projection:',
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .bodyText1,
                                //       ),
                                //       const Text('97%'),
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Campaign ends:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                          '${localCampaignController.campaignDetailsModel?.timeRemainingForCampaignToEnd} days'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${localCampaignController.campaignDetailsModel?.reachedPercentage}% of goals reached',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "My Investments: ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Text("\$300.00"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "My Savings: ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Text("\$80.00"),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(CollectionDBs.videosCollection)
                  .where('user_email', isEqualTo: businessDetailsModel.email)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
