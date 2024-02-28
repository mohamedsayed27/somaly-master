part of 'NotificationsImports.dart';

class NotificationsData{
  final GenericBloc<List<NotifyModel>> notifyCubit = GenericBloc([]);

  fetchData(BuildContext context, {bool refresh = true}) async {
    final data = await CustomerRepository(context).getNotifyCustomer();
    notifyCubit.onUpdateData(data);
  }
}
