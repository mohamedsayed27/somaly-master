import 'package:json_annotation/json_annotation.dart';

part 'order_details_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class OrderDetailsModel {
  @JsonKey(name: 'orderId')
  int orderId;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'orderStutes')
  int? orderStatus;
  @JsonKey(name: 'userImg')
  String userImg;
  @JsonKey(name: 'userLocation')
  String userLocation;
  @JsonKey(name: 'providerImg')
  String providerImg;
  @JsonKey(name: 'providerLocation')
  String providerLocation;
  @JsonKey(name: 'providerName')
  String providerName;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'cityName')
  String cityName;
  @JsonKey(name: 'imgs')
  List<String> imgs;
  @JsonKey(name: 'info')
  String info;
  @JsonKey(name: 'stutes')
  int stutes;
  @JsonKey(name: 'price')
  num price;
  @JsonKey(name: 'priceOffer')
  num priceOffer;
  @JsonKey(name: 'providerId')
  String providerId;
  @JsonKey(name: 'rated')
  bool rated;

  OrderDetailsModel({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.userImg,
    required this.userLocation,
    required this.providerImg,
    required this.providerLocation,
    required this.providerName,
    required this.date,
    this.orderStatus,
    required this.cityName,
    required this.imgs,
    required this.info,
    required this.stutes,
    required this.price,
    required this.priceOffer,
    required this.providerId,
    required this.rated,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsModelToJson(this);
}
