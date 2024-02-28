part of 'SelectUserWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final SelectUserData selectUserData;

  const BuildButtonList({required this.selectUserData});
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        DefaultButton(
          title: tr(context, "customer"),
          onTap:()=> selectUserData.navigateToLogin(context,1),
          margin: const EdgeInsets.symmetric(vertical: 15),
          color: MyColors.primary,
        ),
        DefaultButton(
          title: tr(context, "agency"),
          onTap:()=> selectUserData.navigateToLogin(context,2),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
      ],
    );
  }
}
