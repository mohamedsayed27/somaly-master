part of 'EditProfileWidgetsImports.dart';

class BuildNavigationButtons extends StatelessWidget {
  final EditProfileData data;

  const BuildNavigationButtons({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingButton(
            btnKey: data.btnKey,
            title: "${tr(context, "save")}",
            fontSize: 12,
            margin: EdgeInsets.all(20),
            onTap: () => data.setUpdateProfile(context),
          ),
          InkWell(
            onTap: () => AutoRouter.of(context).push(ChangePasswordRoute()),
            child: MyText(
              title: "${tr(context, "changePass")}",
              color: MyColors.primary,
              size: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
