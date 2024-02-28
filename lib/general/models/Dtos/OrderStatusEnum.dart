enum OrderStatusType {
  NewOrder,
  ClientAccept,
  ProviderSendOffer,
  ClientPay,
  Finished,
  ClientCancel,
}

extension OrderStatusValue on OrderStatusType {
  int getValue() {
    switch (this) {
      case OrderStatusType.NewOrder:
        return 1;
      case OrderStatusType.ClientAccept:
        return 2;
      case OrderStatusType.ProviderSendOffer:
        return 3;
      case OrderStatusType.ClientPay:
        return 4;
      case OrderStatusType.Finished:
        return 5;
      default:
        return 6;
    }
  }
}
