import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Chats {
  String? message;
  String? senderId;
  String? id;
  bool? isSender;
  DateTime? date;
  String? senderType;

  Chats({
    this.message,
    this.id,
    this.isSender,
    this.senderId,
    this.date,
    this.senderType,
  });

  Chats.fromJson(var json, {String? uid}) {
    id = json['id'] ?? uid;
    message = json['message'];
    senderId = json['sender_id'];
    senderType = json['sender_type'];
    isSender =
        senderId == (Provider.of<UserOrBusinessProvider>(Get.context!).uid) &&
            senderType ==
                (Provider.of<UserOrBusinessProvider>(Get.context!)
                    .determineUserType());
    date = (json['time']).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['sender_id'] = senderId;
    data['time'] = date;
    data['sender_type'] = senderType;
    return data;
  }

  @override
  bool operator ==(other) => other is Chats && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
