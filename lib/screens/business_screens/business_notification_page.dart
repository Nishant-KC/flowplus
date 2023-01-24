import 'package:firebase_storage/firebase_storage.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BusinessNotificationPage extends StatefulWidget {
  const BusinessNotificationPage({Key? key}) : super(key: key);

  @override
  State<BusinessNotificationPage> createState() =>
      _BusinessNotificationPageState();
}

class _BusinessNotificationPageState extends State<BusinessNotificationPage> {
  bool _isLoading = true;
  UserOrBusinessProvider userProvider =
      Provider.of<UserOrBusinessProvider>(Get.context!, listen: true);
  @override
  void initState() {
    super.initState();
    listExample();
  }

  ListResult? result;
  Future<void> listExample() async {
    result = await FirebaseStorage.instance
        .ref('${userProvider.businessDetails?.email ?? ""}/')
        .listAll();
    setState(() {
      _isLoading = false;
    });
  }

  _handlePlay(Reference ref) async {
    String link = (await ref.getDownloadURL());
    await Get.to(
      () => VideoPlayerScreen(link: link),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : (result?.items.isEmpty ?? true)
            ? const Text("No Items")
            : ListView(
                children: [
                  ...result!.items.map(
                    (e) => ListTile(
                      title: Text(e.name),
                      trailing: IconButton(
                        onPressed: () {
                          _handlePlay(e);
                        },
                        icon: const Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                ],
              );
  }
}
