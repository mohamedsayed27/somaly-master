import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class OrderModel {
  @JsonKey(name: 'orderId')
  int orderId;
  @JsonKey(name: 'orderType')
  String orderType;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'location')
  String location;
  @JsonKey(name: 'stutes')
  String status;
  @JsonKey(name: 'date')
  String date;

  OrderModel({
    required this.orderId,
    required this.orderType,
    required this.name,
    required this.img,
    required this.location,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
