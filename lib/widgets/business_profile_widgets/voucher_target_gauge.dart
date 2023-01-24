import 'package:flow_plus/screens/business_screens/voucher_balance_tracker.dart';
import 'package:flow_plus/widgets/business_profile_widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../data/controllers/manage_campaign_controller.dart';
import '../../screens/business_screens/business_reg_form.dart';

class VoucherTargetGauge extends StatelessWidget {
  const VoucherTargetGauge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final manageCampaignController = Get.put(ManageCampaignController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Business Name',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => const BusinessRegistrationForm());
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.2,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      showTicks: false,
                      showLabels: false,
                      annotations: [
                        GaugeAnnotation(
                          widget: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Campaign Tracker',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    "${manageCampaignController.campaignPurchasedByUser.value} / ${manageCampaignController.campaignTarget.value}",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                // Text(
                                //   "45/100",
                                //   style: Theme.of(context).textTheme.headline3,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      pointers: const <GaugePointer>[
                        RangePointer(
                          value: 40,
                          width: 0.2,
                          sizeUnit: GaugeSizeUnit.factor,
                          gradient: SweepGradient(
                            colors: <Color>[
                              Color(0xFFCC2B5E),
                              Color(0xFF753A88),
                            ],
                            stops: <double>[0.25, 0.75],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, left: 10.0, right: 10.0, bottom: 20),
                child: Card(
                  color: Colors.blueGrey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Start Date:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(
                                    () => Text(
                                      DateFormat('dd/MM/yyyy').format(
                                        manageCampaignController
                                            .campaignDate.value,
                                      ),
                                    ),

                                    //Text('01/01/2022'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Duration'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(
                                    () => Text(manageCampaignController
                                        .campaignDuration.value),
                                  ),
                                  //Text('06/01/2022'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Projection:'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('97%'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Campaign Goal',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Obx(
                                      () => Text(
                                        manageCampaignController
                                            .campaignTarget.value
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Days Remaining'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('118 Days'),
                                ),
                              ],
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
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.all(16.0),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Get.to(() => const VoucherTracker());
                                    },
                                    child: const Text('Investor List'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SocialMediaIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
