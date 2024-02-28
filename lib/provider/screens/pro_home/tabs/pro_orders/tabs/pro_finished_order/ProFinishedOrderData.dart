part of 'ProFinishedOrderImports.dart';

class ProFinishedOrderData {
  final GenericBloc<List<OrderModel>> finishedOrderCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await ProviderRepository(context).getFinishedOrders(refresh);
    finishedOrderCubit.onUpdateData(data);
  }
}
