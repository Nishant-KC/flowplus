import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:get/get.dart';
// import 'package:toast/toast.dart';

class VideoCollectionHelper {
  final _firestoreInstance = FirebaseFirestore.instance;
  CollectionReference get videosCollection =>
      _firestoreInstance.collection(CollectionDBs.videosCollection);

  addVideo({
    required Map<String, dynamic> videoDetails,
  }) async {
    try {
      await videosCollection.add(videoDetails);
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  // Future<CampaignDetailsModel?> getCampaignDetails(
  //     {required String userId}) async {
  //   try {
  //     DocumentSnapshot documentSnapshot =
  //         await campaignDetailsCollection.doc(userId).get();
  //     if (documentSnapshot.exists) {
  //       CampaignDetailsModel model =
  //           CampaignDetailsModel.fromJson(documentSnapshot);
  //       return model;
  //     }
  //   } on FirebaseException {
  //     Get.snackbar("Error", "Some Error Happened");
  //     return null;
  //   }
  //   return null;
  // }
}
