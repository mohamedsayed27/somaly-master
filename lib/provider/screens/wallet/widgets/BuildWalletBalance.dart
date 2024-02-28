part of 'WalletWidgetsImports.dart';

class BuildWalletBalance extends StatelessWidget {
  final String balance;
  const BuildWalletBalance({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: '${tr(context, 'walletBalance')}  :  ',
            color: MyColors.black,
            size: 13,
            fontWeight: FontWeight.bold,
          ),
          MyText(
            title: '$balance ${tr(context, 'sar')}',
            color: MyColors.primary,
            size: 13,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
