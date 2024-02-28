part of 'OrderDetailsImports.dart';

class OrderDetails extends StatefulWidget {
  final int orderId;

  const OrderDetails({required this.orderId});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderDetailsData data = OrderDetailsData();

  @override
  void initState() {
    data.fetchData(context, widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "orders")}", showBack: true),
      body: BlocBuilder<GenericBloc<OrderDetailsModel?>,
              GenericState<OrderDetailsModel?>>(
          bloc: data.orderDetailsCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              if (state.data != null) {
                return ListView(
                  padding: EdgeInsets.all(15),
                  children: [
                    BuildSummaryCard(
                      model: state.data,
                    ),
                    BuildTextRow(
                        title: "${tr(context, "orderNum")}",
                        value: '${state.data!.orderId}'),
                    BuildTextRow(
                        title: "${tr(context, "orderDate")}",
                        value: '${state.data!.date}'),
                    BuildTextRow(
                        title: "${tr(context, "city")}",
                        value: state.data!.cityName),
                    BuildTextRow(
                        title: "${tr(context, "orderDetails")}",
                        value: state.data!.info),
                    BuildTextRow(
                        title: "${tr(context, "attachments")}",
                        showDivider: false),
                    BuildAttachmentsWrap(
                      model: state.data!,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      alignment: Alignment.center,
                      child: BuildButtonsRow(
                        status: state.data!.stutes,
                        price: state.data!.priceOffer,
                        data: data,
                        orderId: widget.orderId,
                        providerId: state.data?.providerId ?? '',
                        providerName: state.data?.providerName ?? '',
                        rated: state.data!.rated,
                      ),
                    ),
                  ],
                );
              } else {
                return MyText(
                  title: tr(context, 'noDetails'),
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
