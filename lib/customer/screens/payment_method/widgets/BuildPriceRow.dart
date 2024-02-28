part of 'PaymentMethodWidgetsImports.dart';

class BuildPriceRow extends StatelessWidget {
  final String title;
  final String? price;

  const BuildPriceRow({required this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment:
            price != null ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          MyText(
            title: "$title :  ",
            color: MyColors.blackOpacity,
            fontWeight: FontWeight.bold,
            size: 12,
          ),
          Visibility(
            visible: price != null,
            child: MyText(
              title: "$price ${tr(context, "sr")}",
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
