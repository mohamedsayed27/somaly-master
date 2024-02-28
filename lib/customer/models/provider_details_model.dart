import 'package:base_flutter/customer/models/provider_rate_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provider_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderDetailsModel {
  String? userId;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'rate')
  double rate;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'location')
  String location;
  @JsonKey(name: 'info')
  String info;
  @JsonKey(name: 'rateProviderDtos')
  List<ProviderRateModel> rateProviderDtos;
  @JsonKey(name: 'whatsUp')
  String? whatsUp;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'isFollow')
  bool isFollow;

  ProviderDetailsModel({
    required this.userName,
    this.userId,
    required this.rate,
    required this.img,
    required this.lat,
    required this.lng,
    required this.location,
    required this.info,
    required this.rateProviderDtos,
    this.whatsUp,
    required this.email,
    required this.phone,
    required this.isFollow
  });

  factory ProviderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderDetailsModelToJson(this);
}
