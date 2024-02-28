part of 'ServiceDetailsImports.dart';

class ServiceDetails extends StatefulWidget {
  final int subId;
  final String subName;

  const ServiceDetails({required this.subId, required this.subName});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  ServiceDetailsData serviceDetailsData = ServiceDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.subName, showBack: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            BuildServiceSearch(
              data: serviceDetailsData,
              subId: widget.subId,
            ),
            Flexible(
              child: GenericListView<ProviderDetailsModel>(
                type: ListViewType.api,
                cubit: serviceDetailsData.providersCubit,
                onRefresh: serviceDetailsData.fetchData,
                params: [context, widget.subId],
                emptyStr: tr(context, 'noData'),
                itemBuilder: (_, index, item) {
                  return BuildProviderCard(
                    opened: ProviderDetails(
                      servId: widget.subId,
                      model: item,
                      subDeptName: widget.subName,
                    ),
                    serviceDetailsData: serviceDetailsData,
                    subId: widget.subId,
                    model: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
