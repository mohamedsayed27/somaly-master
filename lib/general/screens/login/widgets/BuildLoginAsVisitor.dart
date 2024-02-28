part of 'LoginWidgetsImports.dart';

class BuildLoginAsVisitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: tr(context, "visitor"),
          size: 10,
          color: MyColors.primary,
          decoration: TextDecoration.underline,
        ),
      ],
    );
  }
}
