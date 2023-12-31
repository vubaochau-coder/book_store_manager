import 'package:book_store_manager/utils/converter.dart';

class NotificationModel {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String content;
  final String type;
  final String code;
  final DateTime date;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.type,
    required this.code,
    required this.date,
    required this.isRead,
  });

  factory NotificationModel.fromJson(String id, String userName,
      String userAvatar, Map<String, dynamic> json) {
    return NotificationModel(
      id: id,
      userId: cvToString(json['userId']),
      userName: userName,
      userAvatar: userAvatar,
      content: json['content'],
      type: cvToString(json['type']),
      code: cvToString(json['actionCode']),
      date: cvToDate(json['date']),
      isRead: cvToBool(json['isRead']),
    );
  }
}
