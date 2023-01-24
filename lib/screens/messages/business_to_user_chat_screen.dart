import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/collection_constants.dart';
import '../../data/helpers/chat_collection_helper.dart';
import '../../data/models/chats.dart';
import '../../data/models/chats_general.dart';
import '../../data/models/user_details_model.dart';

class BusinessToUserChat extends StatelessWidget {
  final ChatGeneral chatGeneral;
  final UserDetailsModel businessDetails;
  BusinessToUserChat({
    Key? key,
    required this.chatGeneral,
    required this.businessDetails,
  }) : super(key: key);
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _controller = ScrollController();

  onSend() {
    if (_msgController.text.trim().isNotEmpty) {
      Map<String, dynamic> message = Chats(
        date: DateTime.now(),
        message: _msgController.text,
        senderId: businessDetails.id,
      ).toJson();
      ChatCollectionHelper().addAMessage(
        chatGeneral: chatGeneral,
        message: message,
        receiverId: chatGeneral.userId,
        senderName: businessDetails.firstName!,
      );
      _msgController.clear();
      _jumpToBottom();
    }
  }

  _jumpToBottom() async {
    await Future.delayed(const Duration(milliseconds: 50));
    _controller.jumpTo(
      _controller.position.maxScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(businessDetails.firstName!),
      ),
      body: Column(
        children: [
          _buildChats(chatGeneral),
          _buildTypeBox(),
        ],
      ),
    );
  }

  _buildChats(ChatGeneral chatId) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(CollectionDBs.chatsCollection)
          .doc(chatId.id)
          .collection("messages")
          .orderBy("time", descending: false)
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
            return const Center(child: Text("No Messages Found"));
          } else {
            List<Chats> _messages = snapshot.data!.docs.map((e) {
              print(e.data());
              return Chats.fromJson(e.data(), uid: e.id);
            }).toList();
            _jumpToBottom();
            return Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: _messages[index].isSender! ? 60 : 8,
                      right: _messages[index].isSender! ? 8 : 60,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: _messages[index].isSender!
                          ? Colors.blueGrey
                          : Colors.blueGrey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _messages[index].message!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  _buildTypeBox() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ValueListenableBuilder(
            valueListenable: _msgController,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Flexible(
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: _msgController,
                ),
              );
            },
          ),
          CircleAvatar(
            child: InkWell(
              onTap: onSend,
              child: const Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
