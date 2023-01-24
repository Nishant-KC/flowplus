import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class CampaignDetailsModel {
  DateTime? campaignStartDate;
  DateTime? campaignEndTime;
  String? campaignDuration;
  double? campaignTarget;
  double? campaignPurchasedByUser;

  CampaignDetailsModel({
    this.campaignStartDate,
    this.campaignEndTime,
    this.campaignDuration,
    this.campaignTarget,
    this.campaignPurchasedByUser,
  });
  factory CampaignDetailsModel.fromJson(DocumentSnapshot data) {
    try {
      Map json = data.data() as Map;
      CampaignDetailsModel model = CampaignDetailsModel(
        campaignStartDate:
            json[BusinessCampaignDetailsFormConstants.campaignStartDate]
                .toDate(),
        campaignEndTime:
            json[BusinessCampaignDetailsFormConstants.campaignEndDate].toDate(),
        campaignDuration:
            json[BusinessCampaignDetailsFormConstants.campaignDuration] ?? "",
        campaignTarget:
            ((json[BusinessCampaignDetailsFormConstants.campaignTarget]) ?? 0.0)
                .toDouble(),
        campaignPurchasedByUser: ((json[BusinessCampaignDetailsFormConstants
                    .campaignPurchasedByUser]) ??
                0.0)
            .toDouble(),
      );
      return model;
    } catch (e) {
      return CampaignDetailsModel();
    }
  }

  get reachedPercentage => (campaignPurchasedByUser! / campaignTarget!) * 100;
  get timeRemainingForCampaignToEnd =>
      campaignEndTime!.difference(DateTime.now()).inDays;
}
