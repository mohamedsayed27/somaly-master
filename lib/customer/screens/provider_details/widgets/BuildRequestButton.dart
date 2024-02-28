part of 'ProviderDetailsWidgetsImports.dart';

class BuildRequestButton extends StatelessWidget {
  final int servId;
  final String? providerId;
  final String subDeptName;

  const BuildRequestButton(
      {required this.servId, this.providerId, required this.subDeptName});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: "${tr(context, "serviceReq")}",
      fontSize: 12,
      borderRadius: BorderRadius.circular(15),
      onTap: () => AutoRouter.of(context).push(RequestServiceRoute(
        servId: servId,
        providerId: providerId,
        subDeptName: subDeptName
      )),
    );
  }
}
