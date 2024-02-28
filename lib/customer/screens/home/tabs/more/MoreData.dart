part of 'MoreImports.dart';

class MoreData {
  final GenericBloc<bool> notifyLockCubit = GenericBloc(false);

  setIn(BuildContext context) async {
    var user = context.read<UserCubit>().state.model;
    notifyLockCubit.onUpdateData(!user.closeNotify!);
    print('+++++++++=========>>>> notify = ${!user.closeNotify!}');
  }

  void switchNotify(BuildContext context, bool value) async {
    // await GeneralRepository(context).switchNotify();
    var user = context.read<UserCubit>().state.model;
    user.closeNotify = !value;
    Utils.saveUserData(user);
    notifyLockCubit.onUpdateData(value);
    await GeneralRepository(context).switchNotify();
    context.read<UserCubit>().onUpdateUserData(user);
    print('+++++++++=========>>>> updated notify = ${!user.closeNotify!}');
  }
  void shareApp() async {
    if (Platform.isIOS) {
      Utils.shareApp(
          'https://apps.apple.com/us/app/%D8%AE%D8%AF%D9%85%D8%A7%D8%AA%D9%86%D8%A7/id1616857080');
    } else {
      Utils.shareApp(
          'https://play.google.com/store/apps/details?id=sa.aait.aspbranch.somaly');
    }
  }

}
