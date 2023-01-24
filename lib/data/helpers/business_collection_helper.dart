import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/models/business_financial_details_model.dart';
import 'package:get/get.dart';
// import 'package:toast/toast.dart';

class BusinessCollectionHelper {
  final _firestoreInstance = FirebaseFirestore.instance;
  CollectionReference get businessCollection =>
      _firestoreInstance.collection(CollectionDBs.businessCollection);

  CollectionReference get financialCollection =>
      _firestoreInstance.collection(CollectionDBs.financialCollection);

  checkIfABusinessIdExists({
    required String userID,
  }) async {
    try {
      DocumentSnapshot documentSnapshot =
          await businessCollection.doc(userID).get();
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

  addBusinessDetails({
    required String userID,
    required Map<String, dynamic> businessDetails,
  }) async {
    try {
      await businessCollection.doc(userID).set(businessDetails);
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  addFinanceDetails({
    required String userID,
    required Map<String, dynamic> financeDetails,
  }) async {
    try {
      await financialCollection.doc(userID).set(financeDetails);
      Get.snackbar("Success", "Details Saved Successfully");
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
  }

  Future<BusinessFinancialDetailsModel?> getFinancialDetails(
      {required String userId}) async {
    try {
      DocumentSnapshot documentSnapshot =
          await financialCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return BusinessFinancialDetailsModel.fromJson(documentSnapshot);
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
    return null;
  }

  Future<BusinessDetailsModel?> getBusinessDetails(
      {required String userId}) async {
    try {
      
      DocumentSnapshot documentSnapshot =
          await businessCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return BusinessDetailsModel.fromJson(documentSnapshot);
      }
    } on FirebaseException {
      Get.snackbar("Error", "Some Error Happened");
    }
    return null;
  }
}
