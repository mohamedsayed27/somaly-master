part of 'PaymentWidgetsImports.dart';

class BuildPaymentRow extends StatelessWidget {
  final String imgURL;
  final String title;
  final String subTitle;
  final bool? showDivider;

  const BuildPaymentRow({
    required this.imgURL,
    required this.title,
    required this.subTitle,
    this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            imgURL,
            width: 40,
            height: 40,
          ),
          title: MyText(
            title: title,
            color: MyColors.black,
            size: 14,
          ),
          subtitle: MyText(
            title: subTitle,
            color: MyColors.blackOpacity,
            size: 12,
          ),
        ),
        Visibility(
          visible: showDivider ?? true,
          child: Divider(thickness: 1.5, indent: 20, endIndent: 20),
        ),
      ],
    );
  }
}
