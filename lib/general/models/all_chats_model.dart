import 'package:json_annotation/json_annotation.dart';

part 'all_chats_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AllChatsModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'orderNumber')
  int orderNumber;
  @JsonKey(name: 'lastMsg')
  String lastMsg;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'userImg')
  String userImg;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'date')
  String date;

  AllChatsModel(
      {required this.id,
      required this.orderNumber,
      required this.lastMsg,
      required this.userId,
      required this.userImg,
      required this.userName,
      required this.date});

  factory AllChatsModel.fromJson(Map<String, dynamic> json) =>
      _$AllChatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllChatsModelToJson(this);
}
