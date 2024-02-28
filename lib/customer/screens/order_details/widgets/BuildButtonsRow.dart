part of 'OrderDetailsWidgetsImports.dart';

class BuildButtonsRow extends StatelessWidget {
  final int status;
  final int orderId;
  final num price;
  final OrderDetailsData data;
  final String? providerId;
  final String? providerName;
  final bool? rated;

  const BuildButtonsRow({
    required this.status,
    required this.data,
    required this.orderId,
    required this.price,
    this.providerId,
    this.providerName,
    this.rated,
  });

  @override
  Widget build(BuildContext context) {
    return status == OrderStatusType.NewOrder.getValue()
        ? MyText(
          title: '${tr(context, "waitingSend")}',
          color: MyColors.primary,
          size: 14,
          fontWeight: FontWeight.bold,
        )
        : status == OrderStatusType.ProviderSendOffer.getValue()
            ? Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      title: "${tr(context, "offerAccept")}",
                      fontSize: 12,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => AutoRouter.of(context).push(
                        PaymentMethodRoute(price: price, orderId: orderId),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultButton(
                      title: "${tr(context, "OfferReject")}",
                      fontSize: 12,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.white,
                      textColor: MyColors.primary,
                      borderColor: MyColors.primary,
                      onTap: () => data.refuseOffer(context, orderId),
                    ),
                  ),
                ],
              )
            : status == OrderStatusType.ClientPay.getValue()
                ? DefaultButton(
                    title: "${tr(context, "messageDelegate")}",
                    fontSize: 12,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                    borderRadius: BorderRadius.circular(15),
                    // onTap: (){},
                    onTap: () => AutoRouter.of(context).push(
                      ChatsRoute(
                        receiverId: providerId ?? "",
                        receiverName: providerName ?? "",
                        color: MyColors.primary,
                        orderId: orderId,
                      ),
                    ),
                  )
                : status == OrderStatusType.Finished.getValue()
                    ? Visibility(
                        visible: rated!,
                        replacement: DefaultButton(
                          title: "${tr(context, "RateDelegate")}",
                          fontSize: 12,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 50),
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) {
                                return BuildRatingDialog(
                                  orderDetailsData: data,
                                  providerId: providerId ?? '',
                                );
                              }),
                        ),
                        child: MyText(
                              title: tr(context, 'rateSuccess'),
                              color: Colors.green,
                              size: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    : status == OrderStatusType.ClientCancel.getValue()
                        ? MyText(
                            title: '${tr(context, "orderCanceled")}',
                            color: MyColors.primary,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          )
                        : Container(
                            height: 20,
                            width: 20,
                            color: Colors.red,
                          );
  }
}
