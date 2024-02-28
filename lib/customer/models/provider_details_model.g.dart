// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderDetailsModel _$ProviderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ProviderDetailsModel(
      userName: json['userName'] as String,
      userId: json['userId'] as String?,
      rate: (json['rate'] as num).toDouble(),
      img: json['img'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      location: json['location'] as String,
      info: json['info'] as String,
      rateProviderDtos: (json['rateProviderDtos'] as List<dynamic>)
          .map((e) => ProviderRateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      whatsUp: json['whatsUp'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      isFollow: json['isFollow'] as bool,
    );

Map<String, dynamic> _$ProviderDetailsModelToJson(
        ProviderDetailsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'rate': instance.rate,
      'img': instance.img,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
      'info': instance.info,
      'rateProviderDtos': instance.rateProviderDtos,
      'whatsUp': instance.whatsUp,
      'email': instance.email,
      'phone': instance.phone,
      'isFollow': instance.isFollow,
    };
