part of 'ProOrderDetailsImports.dart';

class ProOrderDetailsData {
  final GenericBloc<OrderDetailsModel?> orderDetailsCubit = GenericBloc(null);
  fetchData(BuildContext context, int orderId) async {
    var data = await ProviderRepository(context).getOrderInfo(orderId);
    orderDetailsCubit.onUpdateData(data);
  }

  endOrder(BuildContext context, int orderId) async {
    var ended = await ProviderRepository(context).endOrder(orderId);
    if (ended) {
      CustomToast.showSimpleToast(msg: tr(context, 'done'));
      AutoRouter.of(context).pop();
    }
  }
}
