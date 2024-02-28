// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => WalletOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallet: json['wallet'] as num,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'wallet': instance.wallet,
    };
