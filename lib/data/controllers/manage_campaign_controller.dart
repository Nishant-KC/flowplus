import 'package:flow_plus/data/helpers/campaign_details_collection_helper.dart';
import 'package:flow_plus/data/models/buisness_campaign_details_model.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ManageCampaignController extends GetxController {
  final List<String> _campaignDurations = [
    "1 Month",
    "6 Months",
    "1 Year",
  ];

  List<String> get campaignDurations => _campaignDurations;
  final campaignDate = DateTime.now().obs;
  final campaignEndDate = DateTime.now().add(const Duration(days: 365)).obs;
  final campaignDuration = "1 year".obs;
  final campaignTarget = (0.0).obs;
  final campaignPurchasedByUser = (0.0).obs;
  final formKey = GlobalKey<FormBuilderState>();
  final isLoading = false.obs;
  final controller = TextEditingController().obs;

  ManageCampaignController() {
    getData();
  }
  getData() async {
    UserOrBusinessProvider userProvider =
        Provider.of<UserOrBusinessProvider>(Get.context!, listen: false);
    CampaignDetailsModel? campaignDetailsModel =
        await CampaignDetailsCollectionHelper()
            .getCampaignDetails(userId: userProvider.uid ?? "");

    updateUsingModel(campaignDetailsModel);
  }

  updateUsingModel(CampaignDetailsModel? campaignDetailsModel) {
    campaignDate.value =
        campaignDetailsModel?.campaignStartDate ?? DateTime.now();
    campaignEndDate.value =
        campaignDetailsModel?.campaignEndTime ?? DateTime.now();
    controller.value = TextEditingController(
        text: (campaignDetailsModel?.campaignTarget ?? 0).toString());
    campaignTarget.value = campaignDetailsModel?.campaignTarget ?? 0.0;
    campaignPurchasedByUser.value =
        campaignDetailsModel?.campaignPurchasedByUser ?? 0.0;
    // updateCampaignTagrget(x
    //     (campaignDetailsModel?.campaignTarget ?? 0).toString());
    campaignDuration.value = campaignDetailsModel?.campaignDuration ?? "1 Year";
  }

  updateCampaignTagrget(String text) {
    formKey.currentState?.reset();
    campaignDuration(text);
  }

  updateCampaignDuration(String count) {
    campaignDuration(count);
    switch (count) {
      case "1 Month":
        campaignEndDate(campaignDate.value.add(const Duration(days: 30)));
        break;
      case "6 Months":
        campaignEndDate(campaignDate.value.add(const Duration(days: 180)));
        break;
      case "1 Year":
        campaignEndDate(campaignDate.value.add(const Duration(days: 365)));
        break;
      default:
    }
  }

  updateCampaignDate(DateTime date) {
    campaignDate(date);
  }

  handleDatePicking() async {
    DateTime? selected = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selected != null) {
      campaignDate(selected);
      Get.snackbar(
        'Updated',
        'The date has been updated',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  handleSave(String businessId) {
    CampaignDetailsCollectionHelper().addCampaignDetails(campaignDetails: {
      "campaign_start_date": campaignDate.value,
      "campaign_end_date": campaignEndDate.value,
      "campaign_target": double.tryParse(controller.value.text) ?? 0.0,
      "business_id": businessId,
      "campaign_duration": campaignDuration.value,
    });

    getData();

    // print("Here");
  }
}
