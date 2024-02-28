import 'package:base_flutter/provider/models/dots/drop_down_model.dart';
import 'package:base_flutter/provider/models/dots/multi_drop_down_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provider_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProviderModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'whatsup')
  String? whatsup;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'imgProfile')
  String? imgProfile;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'typeUser')
  int typeUser;
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'activeCode')
  bool activeCode;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'bankAccountNumber')
  String? bankAccountNumber;
  @JsonKey(name: 'commercialRegisterImg')
  String? commercialRegisterImg;
  @JsonKey(name: 'indentityImg')
  String? indentityImg;
  @JsonKey(name: 'listCat')
  List<MultiDropDownModel>? listCat;
  @JsonKey(name: 'mainCat')
  List<MultiDropDownModel>? mainCat;
  @JsonKey(name: 'info')
  String? info;

  ProviderModel({
    required this.id,
    this.userName,
    this.email,
    this.whatsup,
    this.phone,
    required this.lang,
    required this.imgProfile,
    required this.token,
    required this.typeUser,
    required this.code,
    required this.activeCode,
    this.lat,
    this.lng,
    this.location,
    this.bankAccountNumber,
    this.commercialRegisterImg,
    this.indentityImg,
    this.listCat,
    this.info,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderModelToJson(this);
}
