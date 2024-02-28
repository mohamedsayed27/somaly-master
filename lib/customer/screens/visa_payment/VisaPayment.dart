part of 'VisaPaymentImports.dart';

class VisaPayment extends StatelessWidget {
  const VisaPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "visaPay")}", showBack: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GenericListView(
          children: [
            MyText(
              title: "${tr(context, "insertCardData")}",
              color: MyColors.black,
              size: 12,
            ),
            BuildInputForm(),
          ],
        ),
      ),
      bottomNavigationBar: DefaultButton(
        title: "${tr(context, "confirm")}",
        borderRadius: BorderRadius.circular(15),
        margin: EdgeInsets.all(20),
        fontSize: 12,
        onTap: () => AutoRouter.of(context).pushAndPopUntil(
            SuccessRoute(mainTitle: "${tr(context, "paymentSuccess")}"),
            predicate: (route) => false),
      ),
    );
  }
}
