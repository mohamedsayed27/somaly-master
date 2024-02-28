part of 'ProOrdersImports.dart';

class ProOrders extends StatefulWidget {
  @override
  _ProOrdersState createState() => _ProOrdersState();
}

class _ProOrdersState extends State<ProOrders> {
  final ProOrderData data = ProOrderData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: DefaultAppBar(title:tr(context, "MyOrders")),
        body: Column(
          children: [
            BuildProOrdersTabBar(data: data),
            Flexible(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProCurrentOrder(),
                  // ProProgressingOrders(),
                  ProFinishedOrders()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
