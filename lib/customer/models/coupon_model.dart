import 'package:json_annotation/json_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CouponModel {
  @JsonKey(name: 'lastTotal')
  num lastTotal;
  @JsonKey(name: 'coponId')
  int couponId;

  CouponModel({
    required this.lastTotal,
    required this.couponId,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
