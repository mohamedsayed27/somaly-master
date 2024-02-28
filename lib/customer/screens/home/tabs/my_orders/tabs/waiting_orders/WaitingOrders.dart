part of 'WaitingOrdersWidgetsImports.dart';

class WaitingOrders extends StatefulWidget {
  @override
  State<WaitingOrders> createState() => _WaitingOrdersState();
}

class _WaitingOrdersState extends State<WaitingOrders> {
  final WaitingOrderData data = WaitingOrderData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GenericListView<OrderModel>(
        type: ListViewType.api,
        cubit: data.orderModelCubit,
        onRefresh: data.fetchData,
        emptyStr: "${tr(context, "noNewReq")}",
        params: [context],
        itemBuilder: (_, index, item) {
          return BuildOrderCard(
            model: item,
          );
        },
      ),
    );
  }
}
