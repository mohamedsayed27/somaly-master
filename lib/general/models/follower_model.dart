import 'package:json_annotation/json_annotation.dart';

part 'follower_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class FollowerModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'img')
  String? img;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'userId')
  String? userId;

  FollowerModel({
    required this.id,
    this.img,
    this.location,
    this.name,
    this.userId,
  });

  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);

  Map<String, dynamic> toJson() => _$FollowerModelToJson(this);
}
