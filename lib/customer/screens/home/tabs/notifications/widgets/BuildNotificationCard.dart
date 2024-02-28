part of 'NotificationsWidgetsImports.dart';

class BuildNotificationCard extends StatelessWidget {
  final NotifyModel model;

  const BuildNotificationCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MyColors.grey,
            blurRadius: .1,
            offset: Offset(0, .1),
            spreadRadius: .2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: model.text,
            color: MyColors.primary,
            size: 12,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                MyFlutterApp.time,
                color: MyColors.grey,
                size: 15,
              ),
              SizedBox(width: 5),
              MyText(
                title: model.date,
                color: MyColors.blackOpacity,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
