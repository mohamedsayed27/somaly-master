import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MessageModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'orderId')
  int? orderId;
  @JsonKey(name: 'senderId')
  String? senderId;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'receiverId')
  String? receiverId;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'userImg')
  String? userImg;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'type')
  int? type;

  MessageModel({
    required this.id,
     this.orderId,
     this.senderId,
     this.receiverId,
     this.message,
     this.date,
     this.type,
     this.userName,
     this.userImg,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
