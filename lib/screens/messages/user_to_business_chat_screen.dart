import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flow_plus/constants/collection_constants.dart';
import 'package:flow_plus/data/helpers/chat_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import '../../data/models/business_details_model.dart';
import '../../data/models/chats.dart';
import '../../data/models/chats_general.dart';
import '../../data/models/user_details_model.dart';

class UserToBusinessChatScreen extends StatefulWidget {
  final BusinessDetailsModel businessDetailsModel;

  const UserToBusinessChatScreen(
      {super.key, required this.businessDetailsModel});

  @override
  State<UserToBusinessChatScreen> createState() =>
      _UserToBusinessChatScreenState();
}

class _UserToBusinessChatScreenState extends State<UserToBusinessChatScreen> {
  ChatGeneral? chatGeneral;
  bool messagesPresent = false;
  UserDetailsModel? userDetails;
  String? userType;
  final ScrollController _controller = ScrollController();
  final TextEditingController _msgController = TextEditingController();

  getUserData() async {
    final userProvider =
        Provider.of<UserOrBusinessProvider?>(context, listen: false);
    userDetails = userProvider!.userDetails;
    userType = userProvider.determineUserType();
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bulidlMessages(),
          _buildTypeBox(),
        ],
      ),
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

  _bulidlMessages() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(CollectionDBs.chatsCollection)
          .where(
            'business_id',
            isEqualTo: widget.businessDetailsModel.id,
          )
          .where(
            "user_id",
            isEqualTo: userDetails?.id ?? "",
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
            messagesPresent = false;
            return const Expanded(
                child: Center(child: Text("No Messages Found")));
          } else {
            messagesPresent = true;
            chatGeneral = ChatGeneral.fromJson(snapshot.data!.docs.first.data(),
                uid: snapshot.data!.docs.first.id);
            return _buildChats(chatGeneral!);
          }
        } else {
          return const SizedBox();
        }
      },
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
            List<Chats> messages = snapshot.data!.docs
                .map((e) => Chats.fromJson(e.data(), uid: e.id))
                .toList();
            _jumpToBottom();
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: _controller,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: messages[index].isSender! ? 60 : 8,
                      right: messages[index].isSender! ? 8 : 60,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: messages[index].isSender!
                          ? Colors.blueGrey
                          : Colors.blueGrey.shade800,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      messages[index].message!,
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

  _jumpToBottom() async {
    await Future.delayed(const Duration(milliseconds: 50));
    _controller.jumpTo(
      _controller.position.maxScrollExtent,
    );
  }

  onSend() {
    if (_msgController.text.trim().isNotEmpty) {
      Map<String, dynamic> message = Chats(
        date: DateTime.now(),
        message: _msgController.text,
        senderId: userDetails?.id ?? "",
        senderType: userType,
      ).toJson();
      if (messagesPresent) {
        ChatCollectionHelper().addAMessage(
          chatGeneral: chatGeneral!,
          message: message,
          receiverId: widget.businessDetailsModel.id,
          senderName: userDetails?.firstName ?? "",
        );
      } else {
        ChatCollectionHelper().addAFirstMessage(
          businessID: widget.businessDetailsModel.id ?? "",
          userId: userDetails?.id ?? "",
          message: message,
          senderName: userDetails?.firstName ?? "",
        );
      }
      _msgController.clear();
      _jumpToBottom();
    }
  }
}

/**
 * 
 *   void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      // _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      // _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      // await OpenFile.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    if (message.text.isNotEmpty) {
      Map<String, dynamic> message = Chats(
        date: DateTime.now(),
        message: 'Hello',
        senderId: _user.id,
      ).toJson();
      if (messagesPresent) {
        await ChatCollectionHelper().addAMessage(
          chatGeneral: chatGeneral!,
          message: message,
          receiverId: widget.businessDetailsModel.id!,
          senderName: userDetails?.firstName ?? "",
        );
      } else {
        print("Adding the first message");
        print(AuthenticationHelper().user!.uid);
        await ChatCollectionHelper().addAFirstMessage(
          businessID: widget.businessDetailsModel.id!,
          userId: userDetails?.id ?? "",
          message: message,
          senderName: 'Username',
        );
      }
      // _addMessage(textMessage);
    }
  }

  // void _loadMessages() async {
  //   final response = await rootBundle.loadString('assets/messages.json');
  //   final messages = (jsonDecode(response) as List)
  //       .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
  //       .toList();

  //   setState(() {
  //     _messages = messages;
  //   });
  // }
 */
