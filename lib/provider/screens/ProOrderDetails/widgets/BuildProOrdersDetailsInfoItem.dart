part of 'ProOrderDetailsWidgetsImports.dart';

class BuildProOrdersDetailsInfoItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const BuildProOrdersDetailsInfoItem(
      {required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              MyText(
                title: title,
                color: MyColors.black,
                size: 13,
              ),
              Expanded(
                child: MyText(
                  title: subTitle,
                  color: MyColors.blackOpacity,
                  size: 13,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 5,
          color: MyColors.blackOpacity,
        ),
      ],
    );
  }
}
