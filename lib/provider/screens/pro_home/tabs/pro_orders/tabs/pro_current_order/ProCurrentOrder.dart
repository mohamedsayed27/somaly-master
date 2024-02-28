part of 'ProCurrentOrderImports.dart';

class ProCurrentOrder extends StatefulWidget {
  @override
  _ProCurrentOrderState createState() => _ProCurrentOrderState();
}

class _ProCurrentOrderState extends State<ProCurrentOrder> {
  final ProCurrentOrderData data = ProCurrentOrderData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GenericListView<OrderModel>(
          type: ListViewType.api,
          emptyStr: tr(context, "NowNewOrders"),
          cubit: data.currentOrderCubit,
          params: [context],
          onRefresh: data.fetchData,
          itemBuilder: (_, index, item) {
            return BuildProOrderCard(
              model: item,
            );
          }),
    );
  }
}
