part of 'ProCurrentOrderImports.dart';

class ProCurrentOrderData {
  final GenericBloc<List<OrderModel>> currentOrderCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await ProviderRepository(context).getCurrentOrders(refresh);
    currentOrderCubit.onUpdateData(data);
  }
}
