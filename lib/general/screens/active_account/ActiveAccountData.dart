part of 'ActiveAccountImports.dart';

class ActiveAccountData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController code = new TextEditingController();

  void onActiveAccount(BuildContext context, String userId) async {
    print("=====");
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).sendCode(int.parse(code.text), userId);
      btnKey.currentState!.animateReverse();
    }
  }

  void onResendCode(BuildContext context, String userId) async {
    await GeneralRepository(context).resendCode(userId);
  }
}
