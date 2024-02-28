part of 'ProgressingOrdersImports.dart';

class ProgressingOrders extends StatelessWidget {
  final ProgressingOrdersData data = ProgressingOrdersData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GenericListView<OrderModel>(
        type: ListViewType.api,
        cubit: data.orderModelCubit,
        onRefresh: data.fetchData,
        emptyStr: "${tr(context, "noProgressReq")}",
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
