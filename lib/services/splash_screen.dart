import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/controllers/login_page_controller.dart';
import 'package:flow_plus/data/helpers/business_collection_helper.dart';
import 'package:flow_plus/data/helpers/user_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/business_screens/business_profile_page.dart';
import 'package:flow_plus/screens/login_screens/login_page.dart';
import 'package:flow_plus/screens/user_screens/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _check();
    });
  }

  _check() async {
    String userID =
        Hive.box(HiveConstants.boxName).get(HiveConstants.userId) ?? "";
    int? userType =
        Hive.box(HiveConstants.boxName).get(HiveConstants.typeOfUser);
    UserOrBusinessProvider userProvider =
        Provider.of<UserOrBusinessProvider>(Get.context!, listen: false);

    if (userID == "") {
      Get.offAll(() => LoginPage());
    } else {
      userProvider.assignUser(userID);
      if (userType == TypeOfUser.business.index) {
        userProvider.assignFinanceDetails(await BusinessCollectionHelper()
            .getFinancialDetails(userId: userID));

        userProvider.assignBusinessDetails(await BusinessCollectionHelper()
            .getBusinessDetails(userId: userID));
        Get.offAll(() => const BusinessProfilePage());
      } else {
        userProvider.assignUserDetails(
            await UserCollectionHelper().getUserDetails(userId: userID));
        Get.offAll(() => const UserProfilePage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
