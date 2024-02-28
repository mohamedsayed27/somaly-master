part of 'PaymentMethodImports.dart';

class PaymentMethodData {
  final TextEditingController coupon = TextEditingController();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final GenericBloc<int> onlineRadioCubit = GenericBloc(0);
  final GenericBloc<CouponModel?> couponCubit = GenericBloc(null);

  useCoupon(BuildContext context, num price) async {
    if (coupon.text.isEmpty) {
      CustomToast.showSimpleToast(msg: tr(context, 'addCoupon'));
      return;
    }
    final data =
        await CustomerRepository(context).addCoupon(coupon.text, price);
    couponCubit.onUpdateData(data);
  }

  payOrder(BuildContext context, int orderId, num price) async {
    if (onlineRadioCubit.state.data == 0) {
      CustomToast.showSimpleToast(msg: "${tr(context, "chooseUrPayment")}");
    } else {
      btnKey.currentState?.animateForward();
      var model = AcceptOrderModel(
        orderId: orderId,
        price: price,
        couponId: couponCubit.state.data?.couponId ?? 0,
        typePay: onlineRadioCubit.state.data,
      );
      final result = await CustomerRepository(context).acceptOrder(model);
      btnKey.currentState?.animateReverse();
      if (result) {
        await AutoRouter.of(context).popAndPush(
            SuccessRoute(mainTitle: "${tr(context, "paymentSuccess")}"));
      }
    }
  }
}
