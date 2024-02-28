part of 'ProviderRepoImports.dart';

class ProviderRepository {
  late BuildContext _context;
  late ProviderAuthMethods _providerAuthMethods;
  late ProviderLogicMethods _providerLogicMethods;

  ProviderRepository(BuildContext context) {
    _context = context;
    _providerAuthMethods = new ProviderAuthMethods(_context);
    _providerLogicMethods = new ProviderLogicMethods(_context);
  }

  Future<void> providerRegister(ProRegisterModel model) =>
      _providerAuthMethods.providerRegister(model);

  Future<ProviderModel> getProvDetails() =>
      _providerAuthMethods.getProvDetails();

  Future<List<MultiDropDownModel>> getMainCategories(bool refresh) =>
      _providerAuthMethods.getMainCategories(refresh);
  Future<List<DropDownModel>> getMainServices(bool refresh) =>
      _providerAuthMethods.getMainServices(refresh);
  Future<List<MultiDropDownModel>> getSubCat(List<int> mainCatId) =>
      _providerAuthMethods.getSubCat(mainCatId);

  Future<bool> updateProviderProfile(UpdateProviderProfileModel model) =>
      _providerAuthMethods.updateProviderProfile(model);

  // Logic Repository
  Future<NewOrdersModel> getNewOrders(bool refresh) =>
      _providerLogicMethods.getNewOrders(refresh);

  Future<List<OrderModel>> getCurrentOrders(bool refresh) =>
      _providerLogicMethods.getCurrentOrders(refresh);

  Future<List<OrderModel>> getFinishedOrders(bool refresh) =>
      _providerLogicMethods.getFinishedOrders(refresh);

  Future<OrderDetailsModel> getOrderInfo(int orderId) =>
      _providerLogicMethods.getOrderInfo(orderId);

  Future<void> sendOfferPrice(int orderId, int price) =>
      _providerLogicMethods.sendOfferPrice(orderId, price);

  Future<bool> endOrder(int orderId) => _providerLogicMethods.endOrder(orderId);

  Future<List<NotifyModel>> getNotifyProvider() =>
      _providerLogicMethods.getNotifyProvider();

  Future<bool> removeFollower(String userId) =>
      _providerLogicMethods.removeFollower(userId);

  Future<WalletModel> getProviderWallet() => _providerLogicMethods.getProviderWallet();

  Future<bool> sendPayOutRequest(String orderIds) => _providerLogicMethods.sendPayOutRequest(orderIds);

}
