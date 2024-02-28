part of 'FinishedOrdersImports.dart';

class FinishedOrders extends StatelessWidget {
  final FinishedOrdersData data = FinishedOrdersData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GenericListView<OrderModel>(
        type: ListViewType.api,
        cubit: data.orderModelCubit,
        onRefresh: data.fetchData,
        emptyStr: "${tr(context, "noFinishedReq")}",
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
