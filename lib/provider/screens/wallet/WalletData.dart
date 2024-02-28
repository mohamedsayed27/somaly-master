part of 'WalletImports.dart';

class WalletData {
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GenericBloc<WalletModel?> walletBloc = GenericBloc(null);

  void fetchData(BuildContext context) async {
    final data = await ProviderRepository(context).getProviderWallet();
    walletBloc.onUpdateData(data);
  }

  void sendPayBack(BuildContext context) async {
    if(walletBloc.state.data!.orders.isNotEmpty){
      btnKey.currentState?.animateForward();
      var result = await ProviderRepository(context).sendPayOutRequest(
        '${walletBloc.state.data!.orders.map((e) => e.orderId).toList()}'
      );
      if(result){
        await AutoRouter.of(context).push(SuccessRoute(mainTitle: tr(context, 'orderSendSuccess')));
        btnKey.currentState?.animateReverse();
      } else {
        btnKey.currentState?.animateForward();
      }
    } else {
      return CustomToast.showSimpleToast(msg: tr(context,'noOrders'));
    }
  }

}