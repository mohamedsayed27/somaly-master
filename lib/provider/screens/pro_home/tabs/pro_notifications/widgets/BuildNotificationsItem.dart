part of 'NotificationsWidgetsImports.dart';

class BuildNotificationsItem extends StatelessWidget {
  final NotifyModel model;

  const BuildNotificationsItem({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: MyColors.greyWhite),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            size: 11.5,
            color: MyColors.black,
            title: model.text,
          ),
          Row(
            children: [
              Icon(
                Icons.watch_later_outlined,
                size: 18,
                color: MyColors.primary,
              ),
              SizedBox(width: 5),
              MyText(
                title: "${model.date}",
                size: 11,
                color: MyColors.primary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
