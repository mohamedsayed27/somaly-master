import 'package:json_annotation/json_annotation.dart';

part 'wallet_order_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletOrderModel {
  @JsonKey(name: 'orderId')
  int orderId;
  @JsonKey(name: 'orderDate')
  String orderDate;
  @JsonKey(name: 'orderPrice')
  num orderPrice;
  @JsonKey(name: 'priceAfterCommession')
  num priceAfterCom;
  @JsonKey(name: 'commession')
  num commission;

  WalletOrderModel({
    required this.orderId,
    required this.orderDate,
    required this.orderPrice,
    required this.priceAfterCom,
    required this.commission,
  });

  factory WalletOrderModel.fromJson(Map<String, dynamic> json) =>
      _$WalletOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOrderModelToJson(this);
}
