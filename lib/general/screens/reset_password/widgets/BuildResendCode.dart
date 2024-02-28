part of 'ResetPasswordWidgetsImports.dart';

class BuildResendCode extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;
  const BuildResendCode(
      {required this.resetPasswordData, required this.userId});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: tr(context, "noReceiveCode"),
          size: 13,
          color: MyColors.grey,
        ),
        InkWell(
          onTap: () => resetPasswordData.onResendCode(context, userId),
          child: MyText(
              title: tr(context, "sendCode"),
              size: 13,
              color: MyColors.primary,
              decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
