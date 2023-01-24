import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/models/buisness_campaign_details_model.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/models/redeem_voucher_model.dart';
import 'package:flow_plus/data/models/video_model.dart';

class DataStreams {
  static Stream<BusinessDetailsModel> businessDetails(businessId) {
    return FirebaseFirestore.instance
        .collection(CollectionDBs.businessCollection)
        .doc(businessId)
        .snapshots()
        .map((event) {
      return BusinessDetailsModel.fromJson(event);
    });
  }

  static Stream<List<BusinessDetailsModel>> getBusinesses() {
    return FirebaseFirestore.instance
        .collection(CollectionDBs.businessCollection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((e) => BusinessDetailsModel.fromJson(e))
          .toList();
    });
  }

  static Stream<List<RedeemValueModel>> getVoucherDetails(String userEmail) {
    return FirebaseFirestore.instance
        .collection(CollectionDBs.voucherCollection)
        .where('user_email', isEqualTo: userEmail)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => RedeemValueModel.fromJson(e)).toList();
    });
  }

  static Stream<List<VideoModel>> getVideos(String businessEmail) {
    return FirebaseFirestore.instance
        .collection(CollectionDBs.videosCollection)
        .where('user_email', isEqualTo: businessEmail)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => VideoModel.fromJson(e)).toList();
    });
  }

  static Stream<CampaignDetailsModel> businesssCampaignDetails(businessId) {
    return FirebaseFirestore.instance
        .collection(CollectionDBs.campaignDetailsCollection)
        .doc(businessId)
        .snapshots()
        .map((event) {
      print(event);
      return CampaignDetailsModel.fromJson(event);
    });
  }
}
