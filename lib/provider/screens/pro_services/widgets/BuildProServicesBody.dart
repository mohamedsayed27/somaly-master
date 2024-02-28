part of 'ProServicesWidgetsImports.dart';

class BuildProServicesBody extends StatelessWidget {
  final ProServicesData data;

  const BuildProServicesBody({required this.data});

  @override
  Widget build(BuildContext context) {
    return GenericListView<DropDownModel>(
      cubit: data.mainServicesCubit,
      type: ListViewType.api,
      onRefresh: data.fetchData,
      emptyStr: tr(context,"noNewOrders"),
      params: [context],
      itemBuilder: (_, index, item) {
        return BuildProServicesItem(model: item);
      },
    );
  }
}
