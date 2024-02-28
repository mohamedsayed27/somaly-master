part of 'MoreWidgetsImports.dart';

class BuildMoreNotifySettings extends StatelessWidget {
  final MoreData data;

  const BuildMoreNotifySettings({required this.data});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc, GenericState>(
      bloc: data.notifyLockCubit,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        MyFlutterApp.warning,
                        size: 25,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      MyText(
                        title: '${tr(context, "Alerts")}',
                        color: MyColors.black,
                        size: 11,
                      ),
                    ],
                  ),
                  Switch(
                    value: state.data,
                    onChanged: (value) => data.switchNotify(context, value),
                  ),
                ],
              ),
            ),
            Divider(
              color: MyColors.blackOpacity,
            ),
          ],
        );
      },
    );
  }
}
