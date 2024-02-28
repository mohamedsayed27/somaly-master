import 'dart:io';

class AddOrderModel {
  String? date;
  String? info;
  List<File>? img;
  int? cityId;
  String? providerId;
  int? servId;
  int? couponId;

  AddOrderModel({
    this.providerId,
    this.date,
    this.servId,
    this.img,
    this.info,
    this.cityId,
    this.couponId,
  });

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "img": img,
        "cityId": cityId,
        "info": info,
        "date": date,
        "servId": servId,
        "coponId": couponId,
      };
}
