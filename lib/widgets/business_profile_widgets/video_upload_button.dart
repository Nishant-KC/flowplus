import 'package:flow_plus/data/controllers/video_upload_controller.dart';
import 'package:flow_plus/services/video_upload_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoUploadButton extends GetView<VideoUploadController> {
  final uploadVideoController =
      Get.put(VideoUploadController(), tag: 'videoCont');

  VideoUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => uploadVideoController.isUploading.value
          ? const CupertinoActivityIndicator(
              color: Colors.white,
            )
          : IconButton(
              onPressed: () async {
                await VideoUploadService.uploadVideo();
              },
              icon: const Icon(
                Icons.upload,
              ),
            ),
    );
  }
}
