part of 'ProSendOfferImports.dart';

class ProSendOfferData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController offerController = new TextEditingController();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final GenericBloc<bool> endOrderCubit = GenericBloc(false);

  setOfferPrice(BuildContext context, int orderId) async {
    if (formKey.currentState!.validate()) {
      await ProviderRepository(context).sendOfferPrice(
        orderId,
        int.parse(offerController.text),
      );
    }
  }

  endOrder(BuildContext context, int orderId) async {
    final result = await ProviderRepository(context).endOrder(orderId);
    if (result == true) {
      endOrderCubit.onUpdateData(result);
      CustomToast.showToastNotification(tr(context, "RequestCompleted"));
    } else {
      CustomToast.showToastNotification(tr(context, "SomethingWrong"));
    }
  }
}
