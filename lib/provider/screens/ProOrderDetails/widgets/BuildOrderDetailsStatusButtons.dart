part of 'ProOrderDetailsWidgetsImports.dart';

class BuildOrderDetailsStatusButtons extends StatelessWidget {
  final ProOrderDetailsData data;
  final int? status;
  final int orderId;
  final String userName;
  final String userId;

  const BuildOrderDetailsStatusButtons({
    required this.data,
    required this.orderId,
    required this.userId,
    this.status,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return status == OrderStatusType.NewOrder.getValue()
        ? DefaultButton(
            title: tr(context, "sendPriceQuote"),
            onTap: () {
              AutoRouter.of(context)
                  .popAndPush(ProSendOfferRoute(orderId: orderId));
            },
            margin: const EdgeInsets.all(20),
          )
        : status == OrderStatusType.ProviderSendOffer.getValue()
            ? Container(
                child: MyText(
                    title: tr(context, "WaitingForCustomerConfirmation"),
                    color: MyColors.black,
                    size: 12),
              )
            : status == OrderStatusType.ClientPay.getValue()
                ? Column(
                    children: [
                      DefaultButton(
                        title: tr(context, "MessageTheCustomer"),
                        // fontSize: 12,
                        margin: EdgeInsets.only(top: 50, right: 10, left: 10),
                        borderRadius: BorderRadius.circular(15),
                        onTap: () => AutoRouter.of(context).push(
                          ChatsRoute(
                            receiverId: userId,
                            receiverName: userName,
                            color: MyColors.primary,
                            orderId: orderId,
                          ),
                        ),
                        // onTap: () {},
                      ),
                      DefaultButton(
                        title: tr(context, "checkout"),
                        // fontSize: 12,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        borderRadius: BorderRadius.circular(15),
                        onTap: () => data.endOrder(context, orderId),
                      ),
                    ],
                  )
                : status == OrderStatusType.ClientCancel.getValue()
                    ? MyText(
                        title: '${tr(context, "orderCanceled")}',
                        color: Colors.red,
                        size: 14,
                        fontWeight: FontWeight.bold,
                      )
                    : Container();
  }
}
