import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/models/buisness_campaign_details_model.dart';
import 'package:get/get.dart';
// import 'package:toast/toast.dart';

class CampaignDetailsCollectionHelper {
  final _firestoreInstance = FirebaseFirestore.instance;
  CollectionReference get campaignDetailsCollection =>
      _firestoreInstance.collection(CollectionDBs.campaignDetailsCollection);

  addCampaignDetails({
    required Map<String, dynamic> campaignDetails,
  }) async {
    try {
      await campaignDetailsCollection.doc(campaignDetails['business_id']).set(
          campaignDetails,
          SetOptions(
            mergeFields: [
              "12",
            ],
          ));
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  Future<CampaignDetailsModel?> getCampaignDetails(
      {required String userId}) async {
    try {
      DocumentSnapshot documentSnapshot =
          await campaignDetailsCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        CampaignDetailsModel model =
            CampaignDetailsModel.fromJson(documentSnapshot);
        return model;
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
      return null;
    }
    return null;
  }
}
