part of 'WaitingOrdersWidgetsImports.dart';

class WaitingOrderData {
  final GenericBloc<List<OrderModel>> orderModelCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await CustomerRepository(context).getNewOrders(refresh);
    orderModelCubit.onUpdateData(data);
  }
}
