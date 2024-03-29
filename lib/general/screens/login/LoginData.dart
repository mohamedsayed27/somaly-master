part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController password = new TextEditingController();
  final TextEditingController phone = new TextEditingController();

  final GenericBloc<bool> showPassCubit = GenericBloc(true);

  void userLogin(BuildContext context, int typeUser) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      String phoneEn = Utils.convertDigitsToLatin(phone.text);
      String passEn = Utils.convertDigitsToLatin(password.text);
      await GeneralRepository(context).setUserLogin(phoneEn, passEn, typeUser);
      btnKey.currentState!.animateReverse();
    }
  }

  navigateToRegister(BuildContext context) {
    var type = context.read<UserCubit>().state.model.typeUser;
    if (type == 1) {
      AutoRouter.of(context).push(RegisterRoute());
    } else {
      AutoRouter.of(context).push(ProRegisterRoute());
    }
  }
}
