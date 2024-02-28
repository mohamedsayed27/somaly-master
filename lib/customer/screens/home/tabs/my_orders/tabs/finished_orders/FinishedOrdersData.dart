part of 'FinishedOrdersImports.dart';

class FinishedOrdersData {
  final GenericBloc<List<OrderModel>> orderModelCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await CustomerRepository(context).getEndedOrders(refresh);
    orderModelCubit.onUpdateData(data);
  }
}
