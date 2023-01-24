import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flow_plus/data/controllers/video_upload_controller.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoUploadService {
  static uploadVideo() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      VideoUploadController controller = Get.find(tag: 'videoCont');
      controller.changeStatus(true);
      UserOrBusinessProvider userProvider =
          Provider.of<UserOrBusinessProvider>(Get.context!, listen: false);

      final storageRef = FirebaseStorage.instance
          .ref("${userProvider.businessDetails?.email ?? ""}/");
      Reference? videoRef = storageRef.child(file.path.split('/').last);
      try {
        await videoRef.putFile(file);

        Get.snackbar("Video Upload", "Uploaded Successfully");
        String link = await videoRef.getDownloadURL();

        controller.addUploadLinkToFirestore(link);
        controller.changeStatus(false);
      } on FirebaseException catch (e) {
        debugPrint(e.message);
        controller.changeStatus(false);

        Get.snackbar("Video Upload", "Upload Failed");
      }
    } else {
      Get.snackbar("Video Upload", "Upload Cancelled");
    }
  }
}
