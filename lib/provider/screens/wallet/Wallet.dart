part of 'WalletImports.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  WalletData walletData = WalletData();
  @override
  void initState() {
    walletData.fetchData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg2,
      appBar: DefaultAppBar(
        title: tr(context, 'wallet'),
        showBack: true,
      ),
      body: BlocBuilder<GenericBloc<WalletModel?>, GenericState<WalletModel?>>(
        bloc: walletData.walletBloc,
        builder: (context, state) {
          if(state is GenericUpdateState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildWalletBalance(balance: state.data?.wallet.toString()??''),
                Visibility(
                  visible: state.data!.orders.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: tr(context, 'orders'),
                      color: MyColors.black,
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BuildWalletOrders(orders: state.data?.orders??[]),
                BuildPayBakButton(walletData: walletData),
              ],
            );
          } else {
            return LoadingDialog.showLoadingView();
          }
        },
      ),
    );
  }
}
