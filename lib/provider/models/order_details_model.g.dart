// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    OrderDetailsModel(
      orderId: json['orderId'] as int,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userImg: json['userImg'] as String,
      userLocation: json['userLocation'] as String,
      providerImg: json['providerImg'] as String,
      providerLocation: json['providerLocation'] as String,
      providerName: json['providerName'] as String,
      date: json['date'] as String,
      orderStatus: json['orderStutes'] as int?,
      cityName: json['cityName'] as String,
      imgs: (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      info: json['info'] as String,
      stutes: json['stutes'] as int,
      price: json['price'] as num,
      priceOffer: json['priceOffer'] as num,
      providerId: json['providerId'] as String,
      rated: json['rated'] as bool,
    );

Map<String, dynamic> _$OrderDetailsModelToJson(OrderDetailsModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'userName': instance.userName,
      'userId': instance.userId,
      'orderStutes': instance.orderStatus,
      'userImg': instance.userImg,
      'userLocation': instance.userLocation,
      'providerImg': instance.providerImg,
      'providerLocation': instance.providerLocation,
      'providerName': instance.providerName,
      'date': instance.date,
      'cityName': instance.cityName,
      'imgs': instance.imgs,
      'info': instance.info,
      'stutes': instance.stutes,
      'price': instance.price,
      'priceOffer': instance.priceOffer,
      'providerId': instance.providerId,
      'rated': instance.rated,
    };
