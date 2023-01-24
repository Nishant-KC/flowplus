import 'package:flow_plus/data/helpers/business_collection_helper.dart';
import 'package:flow_plus/data/helpers/user_collection_helper.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/models/business_financial_details_model.dart';
import 'package:flow_plus/data/models/redeem_voucher_model.dart';
import 'package:flow_plus/data/models/user_details_model.dart';
import 'package:flutter/material.dart';

class UserOrBusinessProvider extends ChangeNotifier {
  late String? _uid;
  BusinessFinancialDetailsModel? _businessFinancialDetailsModel;
  RedeemValueModel? _redeemValueModel;
  BusinessDetailsModel? _businessDetailsModel;
  UserDetailsModel? _userDetailsModel;
  String? get uid => _uid;
  BusinessFinancialDetailsModel? get businessFinanceDetails =>
      _businessFinancialDetailsModel;

  BusinessDetailsModel? get businessDetails => _businessDetailsModel;
  UserDetailsModel? get userDetails => _userDetailsModel;
  RedeemValueModel? get redeemSomeValue => _redeemValueModel;

  Future<void> assignUser(String? uid) async {
    _uid = uid;
    notifyListeners();
  }

  String determineUserType() {
    if (_businessDetailsModel == null) {
      return 'USER';
    } else {
      return 'BUSINESS';
    }
  }

  Future<void> refreshFinancialDetails() async {
    _businessFinancialDetailsModel = await BusinessCollectionHelper()
        .getFinancialDetails(userId: _uid ?? "");
    notifyListeners();
  }

  Future<void> assignVoucherValue() async {
    _redeemValueModel =
        await UserCollectionHelper().getVoucherDetails(userId: _uid ?? "");
  }

  // Future<void> assignVoucherValue(
  //   RedeemValueModel? voucherDetails) async {
  //   _redeemValueModel = redeemSomeValue;
  //   notifyListeners();
  // }

  Future<void> assignFinanceDetails(
      BusinessFinancialDetailsModel? financialDetailsModel) async {
    _businessFinancialDetailsModel = financialDetailsModel;
    notifyListeners();
  }

  Future<void> assignBusinessDetails(
      BusinessDetailsModel? businessDetails) async {
    _businessDetailsModel = businessDetails;
    notifyListeners();
  }

  Future<void> assignUserDetails(UserDetailsModel? userDetailsModel) async {
    _userDetailsModel = userDetailsModel;
    notifyListeners();
  }
}
