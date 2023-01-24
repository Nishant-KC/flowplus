import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/collection_constants.dart';
import '../../data/models/chats_general.dart';
import '../../data/providers/user_or_business_provider.dart';
import 'chat_user_view.dart';

class BusinessChatScreen extends StatefulWidget {
  const BusinessChatScreen({Key? key}) : super(key: key);

  @override
  State<BusinessChatScreen> createState() => _BusinessChatScreenState();
}

class _BusinessChatScreenState extends State<BusinessChatScreen> {
  BusinessDetailsModel? businessDetails;

  getBusinessData() async {
    final businessProvider =
        Provider.of<UserOrBusinessProvider?>(context, listen: false);
    businessDetails = businessProvider?.businessDetails;
    print(businessDetails?.id);
  }

  @override
  void initState() {
    getBusinessData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildChats();
  }

  _buildChats() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(CollectionDBs.chatsCollection)
          .where(
            'business_id',
            isEqualTo: businessDetails?.id,
          )
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return const Text("There is an error");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Chats Found"));
          } else {
            List<ChatGeneral> _chats = snapshot.data!.docs
                .map((e) => ChatGeneral.fromJson(e.data(), uid: e.id))
                .toList();
            return ListView.builder(
              shrinkWrap: true,
              itemCount: _chats.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatUserView(chatGeneral: _chats[index]);
              },
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
