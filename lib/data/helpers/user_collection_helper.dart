import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/models/user_details_model.dart';
import 'package:get/get.dart';

import '../models/redeem_voucher_model.dart';
// import 'package:toast/toast.dart';

class UserCollectionHelper {
  final _firestoreInstance = FirebaseFirestore.instance;
  CollectionReference get userCollection =>
      _firestoreInstance.collection(CollectionDBs.userCollection);

  CollectionReference get financialCollection =>
      _firestoreInstance.collection(CollectionDBs.financialCollection);

  CollectionReference get voucherCollection =>
      _firestoreInstance.collection(CollectionDBs.voucherCollection);

  checkIfAUserIdExisitsOrNot({
    required String userID,
  }) async {
    try {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(userID).get();
      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
        return true;
      } else {
        return false;
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  addVoucherDetails({
    required String userID,
    required Map<String, dynamic> voucherDetails,
  }) async {
    try {
      await voucherCollection.doc(userID).set(voucherDetails);
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }
  Future<RedeemValueModel?> getVoucherDetails({required String userId}) async {
    try {
      DocumentSnapshot documentSnapshot =
      await voucherCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return RedeemValueModel.fromJson(documentSnapshot);
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
    return null;
  }

  addUserDetails({
    required String userID,
    required Map<String, dynamic> userDetails,
  }) async {
    try {
      await userCollection.doc(userID).set(userDetails);
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  Future<UserDetailsModel?> getUserDetails({required String userId}) async {
    try {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return UserDetailsModel.fromJson(documentSnapshot);
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
    return null;
  }
}
