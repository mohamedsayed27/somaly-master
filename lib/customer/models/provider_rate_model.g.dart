// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderRateModel _$ProviderRateModelFromJson(Map<String, dynamic> json) =>
    ProviderRateModel(
      id: json['id'] as int,
      date: json['date'] as String?,
      comment: json['comment'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      clientName: json['clientName'] as String,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$ProviderRateModelToJson(ProviderRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'comment': instance.comment,
      'rate': instance.rate,
      'clientName': instance.clientName,
      'img': instance.img,
    };
