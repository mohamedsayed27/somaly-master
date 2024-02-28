part of 'ProProgressingOrderImports.dart';

class ProProgressingOrders extends StatefulWidget {
  const ProProgressingOrders({Key? key}) : super(key: key);

  @override
  _ProProgressingOrdersState createState() => _ProProgressingOrdersState();
}

class _ProProgressingOrdersState extends State<ProProgressingOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GenericListView(
        type: ListViewType.normal,
        // children: List.generate(
        //   5,
        //   (index) => BuildProOrderCard(),
        // ),
      ),
    );
  }
}
