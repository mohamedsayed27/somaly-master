part of 'ProMoreImports.dart';

class ProMore extends StatefulWidget {
  @override
  _ProMoreState createState() => _ProMoreState();
}

class _ProMoreState extends State<ProMore> {
  final ProMoreData proMoreData = ProMoreData();
  @override
  void initState() {
    var user = context.read<UserCubit>().state.model;
    proMoreData.notifyLockCubit = GenericBloc(!user.closeNotify!);
    print('+++++++++=========>>>> notify = ${!user.closeNotify!}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr(context, 'more')),
      body: Container(
        color: MyColors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GenericListView(
          type: ListViewType.normal,
          children: [
            BuildInfoSetting(),
            BuildSettings(proMoreData: proMoreData),
            BuildContactSetting(proMoreData:proMoreData),
          ],
        ),
      ),
    );
  }
}
