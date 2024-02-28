// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletOrderModel _$WalletOrderModelFromJson(Map<String, dynamic> json) =>
    WalletOrderModel(
      orderId: json['orderId'] as int,
      orderDate: json['orderDate'] as String,
      orderPrice: json['orderPrice'] as num,
      priceAfterCom: json['priceAfterCommession'] as num,
      commission: json['commession'] as num,
    );

Map<String, dynamic> _$WalletOrderModelToJson(WalletOrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderDate': instance.orderDate,
      'orderPrice': instance.orderPrice,
      'priceAfterCommession': instance.priceAfterCom,
      'commession': instance.commission,
    };
