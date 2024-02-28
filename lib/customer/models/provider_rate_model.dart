import 'package:json_annotation/json_annotation.dart';

part 'provider_rate_model.g.dart';

@JsonSerializable(nullable: true, ignoreUnannotated: false)
class ProviderRateModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'clientName')
  String clientName;
  @JsonKey(name: 'img')
  String? img;

  ProviderRateModel({
    required this.id,
    this.date,
    this.comment,
    this.rate,
    required this.clientName,
    this.img,
  });

  factory ProviderRateModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderRateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderRateModelToJson(this);
}
