import 'package:json_annotation/json_annotation.dart';

part 'drop_down_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DropDownModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;

  DropDownModel({required this.id, required this.name, required this.img});

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownModelToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}
