import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CustomerModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'lang')
  String lang;
  @JsonKey(name: 'imgProfile')
  String imgProfile;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'typeUser')
  int typeUser;
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'activeCode')
  bool activeCode;
  @JsonKey(name: 'Lat')
  String? lat;
  @JsonKey(name: 'Lng')
  String? lng;
  @JsonKey(name: 'location')
  String? location;

  CustomerModel(
      {required this.id,
      required this.userName,
      required this.phone,
      required this.lang,
      required this.imgProfile,
      required this.token,
      required this.typeUser,
      required this.code,
      required this.location,
      required this.lng,
      required this.lat,
      required this.activeCode});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
