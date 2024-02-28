part of 'ProSendOfferWidgetsImports.dart';

class BuildProSendOfferNumberOrder extends StatelessWidget {
  final ProSendOfferData proSendOfferData;
  final int orderId;
  const BuildProSendOfferNumberOrder(
      {required this.proSendOfferData, required this.orderId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            MyText(
              title: tr(context, "SendQuotationRequestNo"),
              color: MyColors.black,
              size: 12,
            ),
            MyText(
              title: "${orderId}",
              color: MyColors.black,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
