import 'package:base_flutter/customer/models/order_model.dart';
import 'package:base_flutter/provider/models/ads_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_orders_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NewOrdersModel {
  @JsonKey(name: 'order')
  List<OrderModel> orderModel;
  @JsonKey(name: 'ads')
  List<AdsModel> ads;

  NewOrdersModel({required this.ads, required this.orderModel});

  factory NewOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrdersModelToJson(this);
}
