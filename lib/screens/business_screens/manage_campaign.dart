import 'package:flow_plus/data/controllers/manage_campaign_controller.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/widgets/business_profile_widgets/campaign_duration_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/form_constants.dart';
import '../../widgets/_common/custom_form_field.dart';
import 'business_reg_form.dart';

class ManageCampaign extends GetView<ManageCampaignController> {
  ManageCampaign({Key? key}) : super(key: key);
  final manageCampaignController = Get.put(ManageCampaignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Campaign Details',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Campaign Start Date'),
                    InkWell(
                        onTap: manageCampaignController.handleDatePicking,
                        splashColor: Colors.blueGrey.withOpacity(0.5),
                        splashFactory: InkRipple.splashFactory,
                        highlightColor: Colors.blue.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(50),
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                DateFormat('dd/MM/yyyy').format(
                                  manageCampaignController.campaignDate.value,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.edit),
                            ),
                          ],
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Text('Campaign Duration'),
                    const Spacer(),
                    Obx(
                      () =>
                          Text(manageCampaignController.campaignDuration.value),
                    ),
                    CampaignDurationPopupMenu(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Upload Video"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {}, child: const Icon(Icons.video_library)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Upload Images"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {}, child: const Icon(Icons.camera)),
                    )
                  ],
                ),
                _buildTextFields(),
                // CustomButton(
                //   title: 'Save',
                //   onPressed: () {
                //     UserOrBusinessProvider userProvider =
                //         Provider.of<UserOrBusinessProvider>(context, listen: false);
                //     manageCampaignController
                //         .handleSave(userProvider.user?.uid ?? "");
                //   },
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Icon(Icons.video_library,
                    //   size: 40,
                    //   ),
                    // ),
                    ShaderMask(
                      shaderCallback: (bounds) => const RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        colors: [Colors.blue, Colors.red],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.video_library,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                // UserOrBusinessProvider userProvider =
                                // Provider.of<UserOrBusinessProvider>(context, listen: false);
                                // manageCampaignController
                                //     .handleSave(userProvider.user?.uid ?? "");
                                //Get.to(() => const FinancialDetailsForm());
                                // Get.offAll(() => const BusinessRegistrationForm());
                                Get.to(() => const BusinessRegistrationForm());
                              },
                              child: const Text('Details'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                UserOrBusinessProvider userProvider =
                                    Provider.of<UserOrBusinessProvider>(context,
                                        listen: false);
                                manageCampaignController
                                    .handleSave(userProvider.uid ?? "");
                                //Get.to(() => const FinancialDetailsForm());
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  _buildTextFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomFormField(
        hint: "Enter target",
        name: "target",
        isRequired: true,
        controller: manageCampaignController.controller.value,
        isNumeric: true,
      ),
    );
  }

  addCampaignDuration(int number) {
    var profitMargin = BusinessFinancialsFormConstants.grossProfitMargin;
    var monthlyEarnings = BusinessFinancialsFormConstants.monthlyEarnings;
    var newDuration = profitMargin + monthlyEarnings;
  }
}
