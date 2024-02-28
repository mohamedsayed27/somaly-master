import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CityModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
