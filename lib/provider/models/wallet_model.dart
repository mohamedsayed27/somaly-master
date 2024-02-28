import 'package:base_flutter/provider/models/wallet_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletModel {
  @JsonKey(name: 'orders')
  List<WalletOrderModel> orders;
  @JsonKey(name: 'wallet')
  num wallet;

  WalletModel({
    required this.orders,
    required this.wallet,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
