// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as int,
      orderId: json['orderId'] as int?,
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      message: json['message'] as String?,
      date: json['date'] as String?,
      type: json['type'] as int?,
      userName: json['userName'] as String?,
      userImg: json['userImg'] as String?,
    )..userId = json['userId'] as String?;

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'senderId': instance.senderId,
      'userId': instance.userId,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'date': instance.date,
      'userImg': instance.userImg,
      'userName': instance.userName,
      'type': instance.type,
    };
