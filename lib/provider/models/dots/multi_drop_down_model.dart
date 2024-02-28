import 'package:json_annotation/json_annotation.dart';

part 'multi_drop_down_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MultiDropDownModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'selected')
  bool? selected;
  @JsonKey(name: 'img')
  String? img;

  MultiDropDownModel({required this.id, required this.name, this.selected, this.img});

  factory MultiDropDownModel.fromJson(Map<String, dynamic> json) =>
      _$MultiDropDownModelFromJson(json);

  Map<String, dynamic> toJson() => _$MultiDropDownModelToJson(this);
  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}
