import 'package:json_annotation/json_annotation.dart';

part 'notify_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class NotifyModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'type')
  int type;

  NotifyModel(
      {required this.id,
      required this.text,
      required this.date,
      required this.type});

  factory NotifyModel.fromJson(Map<String, dynamic> json) =>
      _$NotifyModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyModelToJson(this);
}
