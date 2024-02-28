part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  final RegisterData data;

  const BuildRegisterButton({required this.data});
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: data.btnKey,
      title: tr(context, 'register'),
      onTap: () => data.setCustomerRegister(context),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: MyColors.primary,
    );
  }
}
