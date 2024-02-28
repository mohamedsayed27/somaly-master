// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      token: json['token'] as String?,
      lang: json['lang'] as String?,
      typeUser: json['typeUser'] as int?,
      code: json['code'] as int?,
      activeCode: json['activeCode'] as bool?,
      closeNotify: json['closeNotify'] as bool?,
      customerModel: json['customerModel'] == null
          ? null
          : CustomerModel.fromJson(
              json['customerModel'] as Map<String, dynamic>),
      providerModel: json['providerModel'] == null
          ? null
          : ProviderModel.fromJson(
              json['providerModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'token': instance.token,
      'typeUser': instance.typeUser,
      'lang': instance.lang,
      'closeNotify': instance.closeNotify,
      'code': instance.code,
      'activeCode': instance.activeCode,
      'customerModel': instance.customerModel,
      'providerModel': instance.providerModel,
    };
