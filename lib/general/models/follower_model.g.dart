// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerModel _$FollowerModelFromJson(Map<String, dynamic> json) =>
    FollowerModel(
      id: json['id'] as int,
      img: json['img'] as String?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$FollowerModelToJson(FollowerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'location': instance.location,
      'name': instance.name,
      'userId': instance.userId,
    };
