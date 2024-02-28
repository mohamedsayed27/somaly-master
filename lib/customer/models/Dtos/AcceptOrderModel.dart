class AcceptOrderModel {
  int? orderId;
  num? price;
  int? couponId;
  int? typePay;

  AcceptOrderModel({
    required this.orderId,
    required this.price,
    required this.couponId,
    required this.typePay,
  });

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "price": price,
        "coponId": couponId,
        "typePay": typePay,
      };
}
