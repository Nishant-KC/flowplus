import 'chats.dart';

class ChatGeneral {
  String? id;
  String? userId;
  String? businessID;
  List<Chats>? chats;

  ChatGeneral({
    this.id,
  });

  ChatGeneral.fromJson(var json, {String? uid}) {
    id = json['id'] ?? uid;
    userId = json['user_id'] ?? '';
    businessID = json['vendor_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['vendor_id'] = businessID;
    data['chats'] = [];
    return data;
  }

  @override
  bool operator ==(other) => other is ChatGeneral && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
