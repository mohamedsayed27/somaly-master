part of 'OrderDetailsImports.dart';

class OrderDetailsData {
  final GenericBloc<OrderDetailsModel?> orderDetailsCubit = GenericBloc(null);
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController comment = TextEditingController();

  double rate = 0;

  fetchData(BuildContext context, int orderId) async {
    var data = await CustomerRepository(context).getOrderInfo(orderId);
    orderDetailsCubit.onUpdateData(data);
  }

  refuseOffer(BuildContext context, int orderId) async {
    await CustomerRepository(context).refuseOrder(orderId);
    orderDetailsCubit.state.data!.stutes =
        OrderStatusType.ClientCancel.getValue();
    orderDetailsCubit.onUpdateData(orderDetailsCubit.state.data);
    CustomToast.showSimpleToast(msg: '${tr(context, "OfferRejected")}');
    AutoRouter.of(context).popAndPush(HomeRoute());
  }

  void addRate(BuildContext context, String providerId) async {
    if(formKey.currentState!.validate()){
      if(rate != 0){
        final result = await CustomerRepository(context).addRate(providerId,
            comment.text, rate, orderDetailsCubit.state.data!.orderId);
        if (result) {
          await AutoRouter.of(context).pop();
          comment.clear();
          CustomToast.showSimpleToast(msg: "${tr(context, "RateSuccess")}");
        }
      } else {
        CustomToast.showSimpleToast(msg: "${tr(context, "addRate")}");
      }
    }
  }
}
