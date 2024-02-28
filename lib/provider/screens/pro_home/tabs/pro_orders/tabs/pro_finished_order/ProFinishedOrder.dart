part of 'ProFinishedOrderImports.dart';

class ProFinishedOrders extends StatefulWidget {
  @override
  _ProFinishedOrdersState createState() => _ProFinishedOrdersState();
}

class _ProFinishedOrdersState extends State<ProFinishedOrders> {
  final ProFinishedOrderData data = ProFinishedOrderData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GenericListView<OrderModel>(
          type: ListViewType.api,
          emptyStr: tr(context, "noOrders"),
          cubit: data.finishedOrderCubit,
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
