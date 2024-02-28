part of 'PaymentMethodWidgetsImports.dart';

class BuildCouponCode extends StatelessWidget {
  final PaymentMethodData paymentMethodData;
  final num price;
  const BuildCouponCode({required this.paymentMethodData,required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          action: TextInputAction.done,
          fillColor: MyColors.white,
          hint: "${tr(context, "discountCode")}",
          controller: paymentMethodData.coupon,
          validate: (value) => value!.noValidate(),
          suffixIcon: Container(
            width: 70,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: ()=> paymentMethodData.useCoupon(context, price),
              child: MyText(
                title: "${tr(context, "activate")}",
                color: MyColors.primary,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        BlocBuilder<GenericBloc<CouponModel?>, GenericState<CouponModel?>>(
          bloc: paymentMethodData.couponCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return BuildPriceRow(
                title: "${tr(context, "priceAfterDiscount")}",
                price: state.data?.lastTotal.toString(),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
