part of 'LoginWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  final LoginData loginData;

  const BuildRegisterButton({required this.loginData});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MyText(
            title: tr(context, "don'tHaveAccount"),
            size: 12,
            alien: TextAlign.center,
            color: MyColors.black,
          ),
        ),
        InkWell(
          onTap: ()=>loginData.navigateToRegister(context),
          child: MyText(
            title: tr(context, "register"),
            size: 12,
            alien: TextAlign.center,
            decoration: TextDecoration.underline,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
