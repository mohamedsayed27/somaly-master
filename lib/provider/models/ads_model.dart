import 'package:json_annotation/json_annotation.dart';

part 'ads_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AdsModel {
  @JsonKey(name: 'id')
  double id;
  @JsonKey(name: 'img')
  String img;

  AdsModel({required this.id, required this.img});

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}
