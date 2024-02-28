part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();
  final TextEditingController code = new TextEditingController();
  final GenericBloc<bool> showPassword = GenericBloc(true);
  final GenericBloc<bool> confirmShowPassword = GenericBloc(true);
  void onResetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      bool result = await GeneralRepository(context)
          .resetUserPassword(userId, code.text, newPassword.text);
      btnKey.currentState!.animateReverse();
      if (result) {
        CustomToast.showSimpleToast(msg: tr(context, "passwordEditedSuccessfully"));
        AutoRouter.of(context).popUntilRouteWithName(LoginRoute.name);
        // ExtendedNavigator.of(context).popUntilPath(Routes.login);
      }
    }
  }

  void onResendCode(BuildContext context, String userId) async {
    await GeneralRepository(context).resendCode(userId);
  }
}
