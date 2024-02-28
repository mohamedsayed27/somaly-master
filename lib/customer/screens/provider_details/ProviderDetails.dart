part of 'ProviderDetailsImports.dart';

class ProviderDetails extends StatefulWidget {
  final ProviderDetailsModel model;
  final int servId;
  final String subDeptName;
  const ProviderDetails({required this.model, required this.servId,required this.subDeptName});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  final ProviderDetailsData data = ProviderDetailsData();
  @override
  void initState() {
    data.followCubit = GenericBloc(widget.model.isFollow);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.subDeptName, showBack: true),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GenericListView(
          children: [
            BuildTitleRow(providerName: widget.model.userName, rate: widget.model.rate),
            CachedImage(
              url: widget.model.img,
              width: MediaQuery.of(context).size.width,
              height: 150,
              borderRadius: BorderRadius.circular(12),
            ),
            BuildInfo(
              providerId: widget.model.userId,
              data: data,
              address: widget.model.location,
              about: widget.model.info,
            ),
            BuildReviews(model: widget.model.rateProviderDtos),
            // BuildSocialIcons(link: widget.model.whatsUp),
            BuildRequestButton(
              servId: widget.servId,
              providerId: widget.model.userId,
              subDeptName: widget.subDeptName,
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_home,
        children: [
          SpeedDialChild(
            child: Icon(MdiIcons.whatsapp, size: 30),
            onTap: () => Utils.launchURL(url: widget.model.whatsUp ?? ""),
          ),
          SpeedDialChild(
            child: Icon(MdiIcons.email, size: 30),
            onTap: () => Utils.sendMail(widget.model.email),
          ),
          SpeedDialChild(
            child: Icon(MdiIcons.phone, size: 30),
            onTap: () => Utils.callPhone(phone: widget.model.phone),
          ),
        ],
      ),
    );
  }
}
