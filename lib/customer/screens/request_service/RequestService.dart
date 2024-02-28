part of 'RequestServiceImports.dart';

class RequestService extends StatefulWidget {
  final int servId;
  final String? providerId;
  final String subDeptName;
  const RequestService({required this.servId, this.providerId,required this.subDeptName});
  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  RequestServicesData requestServicesData = RequestServicesData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.subDeptName, showBack: true),
      body: Container(
        child: GenericListView(
          children: [
            BuildInputForm(
              requestServicesData: requestServicesData,
            ),
            LoadingButton(
              btnKey: requestServicesData.btnKey,
              title: "${tr(context, "confirm")}",
              fontSize: 12,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              onTap: () => requestServicesData.addOrder(
                  context, widget.servId, widget.providerId),
            ),
          ],
        ),
      ),
    );
  }
}
