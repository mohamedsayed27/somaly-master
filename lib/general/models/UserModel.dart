import 'package:base_flutter/general/models/customer_model.dart';
import 'package:base_flutter/general/models/provider_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  String? token;
  int? typeUser;
  String? lang;
  bool? closeNotify;
  int? code;
  bool? activeCode;
  CustomerModel? customerModel;
  ProviderModel? providerModel;

  UserModel({
    this.token,
    this.lang,
    this.typeUser,
    this.code,
    this.activeCode,
    this.closeNotify,
    this.customerModel,
    this.providerModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
