part of 'WalletWidgetsImports.dart';

class BuildWalletOrderItem extends StatelessWidget {
  final WalletOrderModel model;
  const BuildWalletOrderItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.greyWhite),
        boxShadow: [
          BoxShadow(
            color: MyColors.greyWhite,
            spreadRadius: 0.3, blurRadius: 3
          ),
        ]
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "${tr(context, 'OrderNumber')} :  ${model.orderId}",
                color: MyColors.black,
                size: 11,
              ),
              MyText(
                title: "${tr(context, 'date')} :  ${model.orderDate}",
                color: MyColors.black,
                size: 11,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "${tr(context, 'price')} :  ${model.orderPrice} ${tr(context, 'sar')}",
                  color: MyColors.black,
                  size: 11,
                ),
                MyText(
                  title: "${tr(context, 'commission')} :  ${model.commission}%",
                  color: MyColors.black,
                  size: 11,
                ),
              ],
            ),
          ),
          MyText(
            title: "${tr(context, 'priceAfterCom')} :  ${model.priceAfterCom}  ${tr(context, 'sar')}",
            color: MyColors.primary,
            size: 11,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
