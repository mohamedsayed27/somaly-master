part of 'PaymentMethodWidgetsImports.dart';

class BuildConfirmButton extends StatelessWidget {
  final PaymentMethodData paymentMethodData;
  final int orderId;
  final num price;

  const BuildConfirmButton(
      {required this.paymentMethodData,
      required this.orderId,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: "${tr(context, "confirm")}",
      borderRadius: 15,
      btnKey: paymentMethodData.btnKey,
      margin: EdgeInsets.all(20),
      fontSize: 12,
      onTap: () => paymentMethodData.payOrder(context, orderId, price),
    );
  }
}
