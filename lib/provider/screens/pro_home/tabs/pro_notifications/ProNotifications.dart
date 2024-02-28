part of 'ProNotificationsImports.dart';

class ProNotifications extends StatefulWidget {
  @override
  _ProNotificationsState createState() => _ProNotificationsState();
}

class _ProNotificationsState extends State<ProNotifications> {
  final NotificationsData notificationsData = NotificationsData();

  @override
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'notifications'),
        leading: Container(),
      ),
      child: GenericListView(
        onRefresh: notificationsData.getNotifications,
        params: [context],
        refreshBg: MyColors.primary,
        emptyStr: tr(context, "NoNewAlerts"),
        type: ListViewType.api,
        cubit: notificationsData.notificationCubit,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemBuilder: (context, index, item) {
          return BuildNotificationsItem(
            model: item,
          );
        },
      ),
    );
  }
}
