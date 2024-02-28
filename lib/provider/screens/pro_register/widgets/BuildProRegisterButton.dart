part of 'ProRegisterWidgetsImports.dart';

class BuildProRegisterButton extends StatelessWidget {
  final ProRegisterData data;

  const BuildProRegisterButton({required this.data});
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: data.btnKey,
      title: tr(context, 'register'),
      onTap: () {
        data.setProviderRegister(context);
      },
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: MyColors.primary,
    );
  }
}
