import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class RedeemValueModel {
  String? redeemValue;
  String? email;
  String? id;

  RedeemValueModel({this.redeemValue, this.id, this.email});
  factory RedeemValueModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;
    return RedeemValueModel(
      redeemValue: json[RedeemUserVoucherConstants.redeemValue],
    );
  }
}