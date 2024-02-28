part of 'ProSendOfferImports.dart';

class ProSendOffer extends StatefulWidget {
  final int orderId;

  const ProSendOffer({required this.orderId});

  @override
  _ProSendOfferState createState() => _ProSendOfferState();
}

class _ProSendOfferState extends State<ProSendOffer> {
  final ProSendOfferData proSendOfferData = ProSendOfferData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "sendOffer"),
        showBack: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            BuildProSendOfferNumberOrder(
              orderId: widget.orderId,
              proSendOfferData: proSendOfferData,
            ),
            BuildProSendOfferInputs(
              proSendOfferData: proSendOfferData,
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultButton(
        title: tr(context, 'send'),
        onTap: () => proSendOfferData.setOfferPrice(context, widget.orderId),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      ),
    );
  }
}
