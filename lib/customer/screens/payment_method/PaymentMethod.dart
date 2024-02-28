part of 'PaymentMethodImports.dart';

class PaymentMethod extends StatefulWidget {
  final num price;
  final int orderId;

  const PaymentMethod({
    required this.price,
    required this.orderId,
  });

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentMethodData paymentMethodData = PaymentMethodData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "payMethod")}", showBack: true),
      body: Column(
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GenericListView(
                children: [
                  BuildPriceRow(
                      title: "${tr(context, "requestedNumber")}", price: widget.price.toString()),
                  BuildPriceRow(title: "${tr(context, "enterDiscountCode")}"),
                  BuildCouponCode(
                    paymentMethodData: paymentMethodData,
                    price: widget.price,
                  ),
                  Divider(thickness: 1, height: 20),
                  BlocBuilder<GenericBloc<int>, GenericState<int>>(
                    bloc: paymentMethodData.onlineRadioCubit,
                    builder: (context, state) {
                      return Column(
                        children: [
                          RadioListTile(
                            title: MyText(
                              title: "${tr(context, "cash")}",
                              color: MyColors.blackOpacity,
                              size: 12,
                            ),
                            value: TypePayEnum.Cash.getValue(),
                            groupValue: state.data,
                            onChanged: (value) => paymentMethodData.onlineRadioCubit
                                .onUpdateData(TypePayEnum.Cash.getValue()),
                          ),
                          RadioListTile(
                            title: MyText(
                              title: "${tr(context, "online")}",
                              color: MyColors.blackOpacity,
                              size: 12,
                            ),
                            value: TypePayEnum.Online.getValue(),
                            groupValue: state.data,
                            onChanged: (value){
                              CustomToast.showSimpleToast(msg: "${tr(context, "UnAvailableNow")}");
                            },
                            // onChanged: (value) => paymentMethodData.onlineRadioCubit
                            //     .onUpdateData(TypePayEnum.Online.getValue()),
                          ),
                          RadioListTile(
                            title: MyText(
                              title: "${tr(context, "wallet")}",
                              color: MyColors.blackOpacity,
                              size: 12,
                            ),
                            value: TypePayEnum.Pocket.getValue(),
                            groupValue: state.data,
                            onChanged: (value){
                              CustomToast.showSimpleToast(msg: "${tr(context, "UnAvailableNow")}");
                            },
                            // onChanged: (value) => paymentMethodData.onlineRadioCubit
                            //     .onUpdateData(TypePayEnum.Pocket.getValue()),
                          ),
                          RadioListTile(
                            title: MyText(
                              title: "${tr(context, "receipt")}",
                              color: MyColors.blackOpacity,
                              size: 12,
                            ),
                            value: TypePayEnum.Esal.getValue(),
                            groupValue: state.data,
                            onChanged: (value){
                              CustomToast.showSimpleToast(msg: "${tr(context, "UnAvailableNow")}");
                            },
                            // onChanged: (value) => paymentMethodData.onlineRadioCubit
                            //     .onUpdateData(TypePayEnum.Esal.getValue()),
                          ),
                          Divider(thickness: 1, height: 20),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BuildConfirmButton(
            paymentMethodData: paymentMethodData,
            price: widget.price,
            orderId: widget.orderId,
          ),
        ],
      ),
    );
  }
}
