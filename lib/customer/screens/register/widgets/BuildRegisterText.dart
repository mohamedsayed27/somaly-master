part of 'RegisterWidgetsImports.dart';

class BuildRegisterText extends StatelessWidget {
  const BuildRegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.center,
        child: MyText(
          title: tr(context, "plzRegister"),
          size: 13,
          color: MyColors.grey,
        ),
      ),
    );
  }
}
