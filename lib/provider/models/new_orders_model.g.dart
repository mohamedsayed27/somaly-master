// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrdersModel _$NewOrdersModelFromJson(Map<String, dynamic> json) =>
    NewOrdersModel(
      ads: (json['ads'] as List<dynamic>)
          .map((e) => AdsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderModel: (json['order'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewOrdersModelToJson(NewOrdersModel instance) =>
    <String, dynamic>{
      'order': instance.orderModel,
      'ads': instance.ads,
    };
