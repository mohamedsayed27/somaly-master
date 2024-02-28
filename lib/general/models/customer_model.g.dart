// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      phone: json['phone'] as String,
      lang: json['lang'] as String,
      imgProfile: json['imgProfile'] as String,
      token: json['token'] as String,
      typeUser: json['typeUser'] as int,
      code: json['code'] as int,
      location: json['location'] as String?,
      lng: json['Lng'] as String?,
      lat: json['Lat'] as String?,
      activeCode: json['activeCode'] as bool,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'phone': instance.phone,
      'lang': instance.lang,
      'imgProfile': instance.imgProfile,
      'token': instance.token,
      'typeUser': instance.typeUser,
      'code': instance.code,
      'activeCode': instance.activeCode,
      'Lat': instance.lat,
      'Lng': instance.lng,
      'location': instance.location,
    };
