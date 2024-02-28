part of 'PaymentImports.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "paymentWays")}", showBack: true),
      body: GenericListView(
        padding: EdgeInsets.symmetric(vertical: 70),
        children: [
          BuildPaymentRow(
            imgURL: Res.visa,
            title: "${tr(context, "visa")}",
            subTitle: "${tr(context, "payWithVisa")}",
          ),
          BuildPaymentRow(
            imgURL: Res.master_card,
            title: "${tr(context, "master")}",
            subTitle: "${tr(context, "payWithMaster")}",
          ),
          BuildPaymentRow(
            imgURL: Res.mada_Logo,
            title: "${tr(context, "mada")}",
            subTitle: "${tr(context, "payWithMada")}",
          ),
          BuildPaymentRow(
            imgURL: Res.apple_pay,
            title: "${tr(context, "applePay")}",
            subTitle: "${tr(context, "payWithApple")}",
          ),
        ],
      ),
    );
  }
}
