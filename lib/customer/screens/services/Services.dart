part of 'ServicesImports.dart';

class Services extends StatefulWidget {
  final int id;
  final String deptName;
  const Services({required this.id,required this.deptName});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  ServiceData serviceData = ServiceData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.deptName,
        showBack: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            BuildSearchRow(
              data: serviceData,
              id: widget.id,
            ),
            Flexible(
              child: GenericListView<ServiceModel>(
                type: ListViewType.gridApi,
                gridCrossCount: 2,
                cubit: serviceData.servicesCubit,
                onRefresh: serviceData.fetchData,
                params: [context, widget.id],
                spacing: 15,
                runSpacing: 15,
                gridItemHeight: MediaQuery.of(context).size.height * .35,
                emptyStr: tr(context, 'noData'),
                itemBuilder: (_, index, item) {
                  return BuildServiceCard(
                    model: item,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
