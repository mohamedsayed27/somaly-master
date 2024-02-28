part of 'ProOrderDetailsImports.dart';

class ProOrderDetails extends StatefulWidget {
  final int orderId;

  ProOrderDetails({required this.orderId});

  @override
  _ProOrderDetailsState createState() => _ProOrderDetailsState();
}

class _ProOrderDetailsState extends State<ProOrderDetails> {
  final ProOrderDetailsData data = ProOrderDetailsData();

  @override
  void initState() {
    data.fetchData(context, widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        showBack: true,
        title: tr(context, 'orders'),
      ),
      body: BlocBuilder<GenericBloc<OrderDetailsModel?>,
              GenericState<OrderDetailsModel?>>(
          bloc: data.orderDetailsCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              if (state.data != null) {
                return ListView(
                  children: [
                    BuildProOrderDetailsUserCard(model: state.data!),
                    BuildProOrderDetailsInfo(
                      model: state.data!,
                    ),
                    BuildProOrderDetailsPics(
                      model: state.data!,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      child: BuildOrderDetailsStatusButtons(
                        orderId: widget.orderId,
                        data: data,
                        status: state.data?.stutes,
                        userId: state.data!.userId,
                        userName: state.data!.userName,
                      ),
                    )
                  ],
                );
              } else {
                return MyText(
                  title: tr(context, "noDetails"),
                  size: 14,
                  color: MyColors.black,
                );
              }
            } else {
              return Center(
                child: LoadingDialog.showLoadingView(),
              );
            }
          }),
    );
  }
}
