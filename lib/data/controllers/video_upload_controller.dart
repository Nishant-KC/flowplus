import 'package:flow_plus/data/helpers/video_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoUploadController extends GetxController {
  final isUploading = false.obs;

  changeStatus(bool status) {
    isUploading(status);
  }

  addUploadLinkToFirestore(String link) {
    UserOrBusinessProvider userProvider =
        Provider.of<UserOrBusinessProvider>(Get.context!, listen: false);

    VideoCollectionHelper().addVideo(videoDetails: {
      'link': link,
      'user_email': userProvider.businessDetails?.email ?? "",
      "time": DateTime.now(),
    });
  }
}
