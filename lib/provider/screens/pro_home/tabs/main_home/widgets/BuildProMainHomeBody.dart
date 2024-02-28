part of 'ProMainHomeWidgetsImports.dart';

class BuildProMainHomeBody extends StatelessWidget {
  final ProMainHomeData data;

  const BuildProMainHomeBody({required this.data});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GenericListView<OrderModel>(
        padding: EdgeInsets.symmetric(horizontal: 10),
        type: ListViewType.api,
        cubit: data.orderModelCubit,
        onRefresh: data.fetchData,
        emptyStr: tr(context, "noNewOrders"),
        params: [context],
        itemBuilder: (_, index, item) {
          return BuildProMainHomeItem(
            data: data,
            model: item,
          );
        },
      ),
    );
    //   Flexible(
    //   child: ListView.builder(
    //     itemCount: 10,
    //     itemBuilder: (_, index) => BuildProMainHomeItem(data: data),
    //   ),
    // );
  }
}
