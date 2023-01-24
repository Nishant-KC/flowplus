import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/collection_constants.dart';
import '../models/chats_general.dart';
// import 'package:toast/toast.dart';

class ChatCollectionHelper {
  final _firestoreInstance = FirebaseFirestore.instance;
  CollectionReference get chatsCollectecion =>
      _firestoreInstance.collection(CollectionDBs.chatsCollection);

  addAFirstMessage({
    required String businessID,
    required String userId,
    required Map<String, dynamic> message,
    required String senderName,
  }) async {
    try {
      DocumentReference chatReference = await chatsCollectecion.add({
        "business_id": businessID,
        "user_id": userId,
      });
      chatsCollectecion
          .doc(chatReference.id)
          .collection("messages")
          .add(message);
      // OneSignalUtils.sendNotification(
      //     message['message'], "New Chat Received from $senderName", vendorId);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Some Error Happened",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  addAMessage({
    required ChatGeneral chatGeneral,
    required Map<String, dynamic> message,
    required receiverId,
    required senderName,
  }) {
    try {
      chatsCollectecion.doc(chatGeneral.id).collection("messages").add(message);
      // OneSignalUtils.sendNotification(
      //   message['message'],
      //   "New Chat Received From $senderName",
      //   receiverId,
      // );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Some Error Happened",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
