part of 'ProMoreWidgetsImports.dart';

class BuildProMoreNotifySettings extends StatelessWidget {
  final ProMoreData data;

  const BuildProMoreNotifySettings({required this.data});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return BlocBuilder<GenericBloc, GenericState>(
      bloc: data.notifyLockCubit,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    MyFlutterApp.warning,
                    size: 23,
                    color: MyColors.black,
                  ),
                  SizedBox(width: 30),
                  MyText(
                    title: tr(context, "alerts"),
                    color: MyColors.black,
                    size: 12,
                  ),
                  Spacer(),
                  Switch(
                    value: state.data,
                    onChanged: (value) => data.switchNotify(context, value),
                  ),
                ],
              ),
            ),
            Divider(
              color: MyColors.blackOpacity,
              height: 5,
            ),
          ],
        );
      },
    );
  }
}
