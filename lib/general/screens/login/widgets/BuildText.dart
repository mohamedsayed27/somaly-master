part of 'LoginWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: MyText(
        title: tr(context, "LoginPlease"),
        size: 14,
        color: MyColors.blackOpacity,
        fontWeight: FontWeight.bold,
        alien: TextAlign.center,
      ),
    );
  }
}
