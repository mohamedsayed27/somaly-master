part of 'ForgetPasswordImports.dart';

class ForgerPasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController phone = new TextEditingController();

  void onForgetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      String? result =
          await GeneralRepository(context).forgetPassword(phone.text);
      btnKey.currentState!.animateReverse();
      if (result != null) {
        CustomToast.showSimpleToast(msg: "${tr(context, "codeSendSuccess")}");
        AutoRouter.of(context).push(ResetPasswordRoute(userId: result));
      }
    }
  }
}
