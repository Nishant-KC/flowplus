import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/data/models/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/collection_constants.dart';
import '../../data/models/chats_general.dart';
import 'business_to_user_chat_screen.dart';

class ChatUserView extends StatelessWidget {
  final ChatGeneral chatGeneral;
  const ChatUserView({Key? key, required this.chatGeneral}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(CollectionDBs.userCollection)
          .doc(chatGeneral.userId)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return const Text("There is an error");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          if (!snapshot.data!.exists) {
            return const SizedBox();
          } else {
            UserDetailsModel? user = UserDetailsModel.fromJson(snapshot.data!);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => BusinessToUserChat(
                        chatGeneral: chatGeneral,
                        businessDetails: user,
                      ));
                },
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsEstSUEao_yI77hBgl15kq8uYC-8auwvyuQ&usqp=CAU'),
                ),
                title: Text(user.firstName!),
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
