part of 'ProProfileWidgetsImports.dart';

class BuildProProfileChangePassword extends StatelessWidget {
  final ProProfileData data;

  const BuildProProfileChangePassword({required this.data});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ChangePasswordRoute());
      },
      child: MyText(
        alien: TextAlign.center,
        title: tr(context, "changePassword"),
        color: MyColors.primary,
        size: 12,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
