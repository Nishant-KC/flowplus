import 'package:flow_plus/data/controllers/manage_campaign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDurationPopupMenu extends StatelessWidget {
  CampaignDurationPopupMenu({Key? key}) : super(key: key);
  final manageCampaignController = Get.find<ManageCampaignController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.blueGrey.withOpacity(0.5),
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.blue.withOpacity(0.4),
      borderRadius: BorderRadius.circular(50),
      child: PopupMenuButton<String>(
        initialValue: "",
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.edit),
        ),
        onSelected: (val) {
          manageCampaignController.campaignDuration(val);
        },
        itemBuilder: (context) {
          return [
            ...manageCampaignController.campaignDurations.map(
              (e) => PopupMenuItem(
                value: e,
                child: Text(e),
              ),
            )
          ];
        },
      ),
    );
  }
}
