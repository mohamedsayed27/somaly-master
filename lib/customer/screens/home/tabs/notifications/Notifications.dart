part of 'NotificationsImports.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  NotificationsData notificationsData = NotificationsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "notifications")}"),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GenericListView(
          type: ListViewType.api,
          onRefresh: notificationsData.fetchData,
          params: [context],
          cubit: notificationsData.notifyCubit,
          emptyStr: tr(context, "noNotifications"),
          itemBuilder: (_, index, item){
            return BuildNotificationCard(
              model: item,
            );
          },
        ),
      ),
    );
  }
}
