// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json['orderId'] as int,
      orderType: json['orderType'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      location: json['location'] as String,
      status: json['stutes'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderType': instance.orderType,
      'name': instance.name,
      'img': instance.img,
      'location': instance.location,
      'stutes': instance.status,
      'date': instance.date,
    };
