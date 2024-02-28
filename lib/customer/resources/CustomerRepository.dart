part of 'CustomerRepositoryImports.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerAuthMethods _customerAuthMethods;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerAuthMethods = CustomerAuthMethods(_context);
    _customerHttpMethods = CustomerHttpMethods(_context);
  }

  Future<bool> userRegister(RegisterModel model) =>
      _customerAuthMethods.userRegister(model);

  Future<void> updateUserProfile(UpdateUserProfileModel model) =>
      _customerAuthMethods.updateUserProfile(model);

  Future<List<ServiceModel>> getMainServices() =>
      _customerHttpMethods.getMainServices();

  Future<List<ServiceModel>> getSubServices(List<int> servId, bool refresh) =>
      _customerHttpMethods.getSubServices(servId, refresh);

  Future<List<NotifyModel>> getNotifyCustomer() =>
      _customerHttpMethods.getNotifyCustomer();

  Future<List<OrderModel>> getNewOrders(bool refresh) =>
      _customerHttpMethods.getNewOrders(refresh);

  Future<List<OrderModel>> getCurrentOrders(bool refresh) =>
      _customerHttpMethods.getCurrentOrders(refresh);

  Future<List<OrderModel>> getEndedOrders(bool refresh) =>
      _customerHttpMethods.getEndedOrders(refresh);

  Future<List<ProviderDetailsModel>> getProviders(int subId) =>
      _customerHttpMethods.getProviders(subId);

  Future<List<CityModel>> getCities() => _customerHttpMethods.getCities();
  Future<dynamic> removeAccount() => _customerAuthMethods.removeAccount();
  Future<void> addOrder(AddOrderModel model) =>
      _customerHttpMethods.addOrder(model);

  Future<bool> addFollowCustomer(String providerId) =>
      _customerHttpMethods.addFollowCustomer(providerId);

  Future<bool> unFollowProvider(String providerId) =>
      _customerHttpMethods.unFollowProvider(providerId);

  Future<bool> refuseOrder(int orderId) =>
      _customerHttpMethods.refuseOrder(orderId);

  Future<OrderDetailsModel> getOrderInfo(int orderId) =>
      _customerHttpMethods.getOrderInfo(orderId);

  Future<CouponModel> addCoupon(String coupon, num price) =>
      _customerHttpMethods.addCoupon(coupon, price);

  Future<bool> acceptOrder(AcceptOrderModel model) =>
      _customerHttpMethods.acceptOrder(model);

  Future<String> uploadFile(File file) => _customerHttpMethods.uploadFile(file);

  Future<List<MessageModel>> getHomeMsg(int pageNumber) =>
      _customerHttpMethods.getHomeMsg(pageNumber);

  Future<bool> addRate(
          String providerId, String comment, double rate, int orderId) =>
      _customerHttpMethods.addRate(providerId, comment, rate, orderId);
}
