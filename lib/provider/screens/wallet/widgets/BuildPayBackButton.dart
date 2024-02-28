part of 'WalletWidgetsImports.dart';

class BuildPayBakButton extends StatelessWidget {
  final WalletData walletData;
  const BuildPayBakButton({required this.walletData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingButton(
        btnKey: walletData.btnKey,
        title: tr(context, 'payBackRequest'),
        onTap: ()=> walletData.sendPayBack(context),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
