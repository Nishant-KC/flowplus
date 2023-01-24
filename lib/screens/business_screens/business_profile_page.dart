import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/data_streams.dart';
import 'package:flow_plus/data/models/buisness_campaign_details_model.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/login_screens/login_page.dart';
import 'package:flow_plus/widgets/business_profile_widgets/video_upload_button.dart';
import 'package:flow_plus/widgets/business_profile_widgets/voucher_target_gauge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../messages/business_chat_screen.dart';
import 'business_health.dart';
import 'business_notification_page.dart';

class BusinessProfilePage extends StatefulWidget {
  const BusinessProfilePage({Key? key}) : super(key: key);

  @override
  _BusinessProfilePageState createState() => _BusinessProfilePageState();
}

class _BusinessProfilePageState extends State<BusinessProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final _actions = [
    VideoUploadButton(),
    IconButton(
      onPressed: () {
        Get.offAll(() => LoginPage());
        Hive.box(HiveConstants.boxName).clear();
      },
      icon: const Icon(Icons.logout),
    )
  ];
  @override
  Widget build(BuildContext context) {
    UserOrBusinessProvider user = Provider.of<UserOrBusinessProvider>(context);
    return MultiProvider(
      providers: [
        StreamProvider<BusinessDetailsModel?>(
          create: (context) => DataStreams.businessDetails(user.uid ?? ""),
          initialData: null,
        ),
        StreamProvider<CampaignDetailsModel?>(
          create: (context) =>
              DataStreams.businesssCampaignDetails(user.uid ?? ""),
          initialData: null,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'STEAM',
            style: TextStyle(
              letterSpacing: 8,
            ),
          ),
          actions: _actions,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.area_chart)),
              Tab(
                icon: Icon(
                  Icons.attach_money_sharp,
                ),
              ),
              Tab(icon: Icon(Icons.message)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            VoucherTargetGauge(),
            //const VoucherTracker(),
            BusinessHealthWidget(),
            //Center(child: Text(user.user?.uid ?? "")),
            //ManageCampaign()
            BusinessChatScreen()
          ],
        ),
      ),
    );
  }
}
