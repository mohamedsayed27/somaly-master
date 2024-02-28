part of 'ProgressingOrdersImports.dart';

class ProgressingOrdersData {
  final GenericBloc<List<OrderModel>> orderModelCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await CustomerRepository(context).getCurrentOrders(refresh);
    orderModelCubit.onUpdateData(data);
  }
}
