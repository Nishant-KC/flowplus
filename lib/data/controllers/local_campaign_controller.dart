import 'package:flow_plus/data/helpers/campaign_details_collection_helper.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:get/get.dart';

import 'package:flow_plus/data/models/buisness_campaign_details_model.dart';

class LocalCampaignController extends GetxController {
  CampaignDetailsModel? campaignDetailsModel;
  BusinessDetailsModel businessDetailsModel;
  final isLoading = true.obs;
  List<String> result = [];
  LocalCampaignController({
    required this.businessDetailsModel,
    this.campaignDetailsModel,
  });

  @override
  void onInit() {
    super.onInit();
    getCampaignDetails();
  }

  changeLoadingStatus(bool status) {
    isLoading(status);
  }

  getCampaignDetails() async {
    // var r = await FirebaseStorage.instance
    //     .ref('${businessDetailsModel.email ?? ""}/')
    //     .listAll();

    // if (r.items.isNotEmpty) {
    //   for (var e in r.items) {
    //     result.add(await e.getDownloadURL());
    //   }
    // }
    campaignDetailsModel = await CampaignDetailsCollectionHelper()
        .getCampaignDetails(userId: businessDetailsModel.id ?? "");
    changeLoadingStatus(false);
  }
}
