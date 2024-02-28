import 'package:json_annotation/json_annotation.dart'; 

part 'service_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServiceModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;

  ServiceModel({required this.id, required this.name, required this.img});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

