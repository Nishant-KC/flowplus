import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class UserDetailsModel {
  String? firstName;
  String? id;
  UserDetailsModel({
    this.firstName,
    this.id,
  });
  factory UserDetailsModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;
    return UserDetailsModel(
      firstName: json[UserInfoFormConstants.firstName],
      id: data.id,
    );
  }
}
