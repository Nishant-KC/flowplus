import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class BusinessDetailsModel {
  String? id;
  String? businessName;
  String? imageName;
  String? businessNumber;
  String? businessType;
  String? businessAddress;
  String? email;
  BusinessDetailsModel({
    this.businessName,
    this.imageName,
    this.businessNumber,
    this.businessType,
    this.businessAddress,
    this.email,
    this.id,
  });
  factory BusinessDetailsModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;

    return BusinessDetailsModel(
      id: data.id,
      businessName: json[BusinessInfoFormConstants.businessName],
      imageName: json[BusinessInfoFormConstants.businessImage],
      businessAddress: json[BusinessInfoFormConstants.businessAddress],
      businessNumber: json[BusinessInfoFormConstants.businessNumber] ?? "",
      businessType: json[BusinessInfoFormConstants.businessType],
      email: json[BusinessInfoFormConstants.email],
    );
  }
}
