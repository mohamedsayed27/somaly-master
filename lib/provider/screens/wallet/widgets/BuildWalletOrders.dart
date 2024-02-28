part of 'WalletWidgetsImports.dart';

class BuildWalletOrders extends StatelessWidget {
  final List<WalletOrderModel> orders;

  const BuildWalletOrders({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: orders.isNotEmpty
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (_, index) {
                return BuildWalletOrderItem(
                  model: orders[index],
                );
              },
            )
          : Center(
              child: MyText(
                title: tr(context, 'noOrders'),
                color: MyColors.primary,
                size: 13,
              ),
            ),
    );
  }
}
