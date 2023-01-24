import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String? id;
  String? link;
  String? email;
  DateTime? time;
  VideoModel({
    this.id,
    this.link,
    this.email,
    this.time,
  });
  factory VideoModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;

    return VideoModel(
        id: data.id,
        link: json['link'],
        email: json['user_email'] ?? "",
        time: (json['time']).toDate());
  }
}
