// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_drop_down_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiDropDownModel _$MultiDropDownModelFromJson(Map<String, dynamic> json) =>
    MultiDropDownModel(
      id: json['id'] as int,
      name: json['name'] as String,
      selected: json['selected'] as bool?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$MultiDropDownModelToJson(MultiDropDownModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'selected': instance.selected,
      'img': instance.img,
    };
