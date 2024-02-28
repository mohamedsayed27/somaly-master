part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  final LoginData loginData;
  final int typeUser;
  const BuildLoginButton({required this.loginData,required this.typeUser});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: loginData.btnKey,
      title: tr(context, "login"),
      onTap: () => loginData.userLogin(context, typeUser),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
