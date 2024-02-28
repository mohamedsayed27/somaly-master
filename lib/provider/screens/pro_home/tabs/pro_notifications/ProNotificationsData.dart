part of 'ProNotificationsImports.dart';

class NotificationsData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  final GenericBloc<List<NotifyModel>> notificationCubit =
      GenericBloc<List<NotifyModel>>([]);

  Future<void> getNotifications(BuildContext context,
      {bool refresh = true}) async {
    final data = await ProviderRepository(context).getNotifyProvider();
    notificationCubit.onUpdateData(data);
  }
}
