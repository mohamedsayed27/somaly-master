// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    ProviderModel(
      id: json['id'] as String,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      whatsup: json['whatsup'] as String?,
      phone: json['phone'] as String?,
      lang: json['lang'] as String?,
      imgProfile: json['imgProfile'] as String?,
      token: json['token'] as String,
      typeUser: json['typeUser'] as int,
      code: json['code'] as int,
      activeCode: json['activeCode'] as bool,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      location: json['location'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      commercialRegisterImg: json['commercialRegisterImg'] as String?,
      indentityImg: json['indentityImg'] as String?,
      listCat: (json['listCat'] as List<dynamic>?)
          ?.map((e) => MultiDropDownModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: json['info'] as String?,
    )..mainCat = (json['mainCat'] as List<dynamic>?)
        ?.map((e) => MultiDropDownModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ProviderModelToJson(ProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'whatsup': instance.whatsup,
      'phone': instance.phone,
      'lang': instance.lang,
      'imgProfile': instance.imgProfile,
      'token': instance.token,
      'typeUser': instance.typeUser,
      'code': instance.code,
      'activeCode': instance.activeCode,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
      'bankAccountNumber': instance.bankAccountNumber,
      'commercialRegisterImg': instance.commercialRegisterImg,
      'indentityImg': instance.indentityImg,
      'listCat': instance.listCat,
      'mainCat': instance.mainCat,
      'info': instance.info,
    };
