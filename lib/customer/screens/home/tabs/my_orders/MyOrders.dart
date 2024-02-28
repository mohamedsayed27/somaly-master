part of 'MyOrdersImports.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyOrdersData myOrdersData = MyOrdersData();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: DefaultAppBar(title: "${tr(context, "orders")}"),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: BuildMyOrdersTabBar(myOrdersData: myOrdersData),
            ),
            Flexible(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  WaitingOrders(),
                  ProgressingOrders(),
                  FinishedOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
