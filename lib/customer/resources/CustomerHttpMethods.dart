part of 'CustomerRepositoryImports.dart';

class CustomerHttpMethods {
  BuildContext context;

  CustomerHttpMethods(this.context);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<List<ServiceModel>> getMainServices() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<ServiceModel>(context).callApi(
      name: ApiNames.listMainService +"?lang=$lang",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => ServiceModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<ServiceModel>> getSubServices(List<int> servId, bool refresh) async {
    return await GenericHttp<ServiceModel>(context).callApi(
      name: ApiNames.listSubService,
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      json: {
        "servIds": servId,
      },
      toJsonFunc: (json) => ServiceModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );
  }

  Future<List<OrderModel>> getNewOrders(bool refresh) async {
    final data = await GenericHttp<OrderModel>(context).callApi(
      name: ApiNames.listNewOrderForUser,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      json: {},
      toJsonFunc: (json) => OrderModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<OrderModel>> getCurrentOrders(bool refresh) async {
    final data = await GenericHttp<OrderModel>(context).callApi(
      name: ApiNames.listCurrentOrderForUser,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => OrderModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<OrderModel>> getEndedOrders(bool refresh) async {
    final data = await GenericHttp<OrderModel>(context).callApi(
      name: ApiNames.listEndedOrderForUser,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => OrderModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<NotifyModel>> getNotifyCustomer() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<NotifyModel>(context).callApi(
      name: ApiNames.listOfNotifyClient +"?lang=$lang",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => NotifyModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<ProviderDetailsModel>> getProviders(int subId) async {
    final data = await GenericHttp<ProviderDetailsModel>(context).callApi(
      name: ApiNames.listProviders + "?subId=$subId",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => ProviderDetailsModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<void> addOrder(AddOrderModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addOrder,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: false,
    );
    if (data != null) {
      // CustomToast.showToastNotification("تم إرسال طلبك بنجاح");
      Navigator.of(context).pop();
      AutoRouter.of(context).push(SuccessRoute(
          mainTitle: "${tr(context, "orderSendSuccess")}",
          subtitle:
              "${tr(context, "doneOperation")}"));
      // AutoRouter.of(context).push(SuccessRoute(
      //     mainTitle: "تم إرسال طلبك بنجاح",
      //     subtitle:
      //         "تم إرسال طلبك بنجاح وسيتم الرد عليكم من خلال مقدم الخدمة"));
    }
  }

  Future<bool> acceptOrder(AcceptOrderModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.acceptAndPayOffer,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      showLoader: false,
    );
    return (data != null);
  }

  Future<bool> refuseOrder(int orderId) async {
    var data = await GenericHttp<OrderDetailsModel>(context).callApi(
      name: ApiNames.refuseOffer + "?orderId=$orderId",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      showLoader: false,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => OrderDetailsModel.fromJson(json),
    );
    return (data != null);
  }

  Future<CouponModel> addCoupon(String coupon, num price) async {
    var data = await GenericHttp<CouponModel>(context).callApi(
      name: ApiNames.useCoupon,
      json: {
        "couponCode": coupon,
        "total": price,
        "userId": context.read<UserCubit>().state.model.customerModel?.id,
      },
      returnType: ReturnType.Model,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => CouponModel.fromJson(json),
    );
    return data;
  }

  Future<OrderDetailsModel> getOrderInfo(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<OrderDetailsModel>(context).callApi(
      name: ApiNames.getOrderInfoForUser + "?orderId=$orderId&lang=$lang",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      toJsonFunc: (json) => OrderDetailsModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );
  }

  Future<bool> addFollowCustomer(String providerId) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addProviderToFollowers + "?providerId=$providerId",
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      json: {"providerId": providerId},
      showLoader: true,
    );
    return (data != null);
  }

  Future<bool> unFollowProvider(String providerId) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.removeProviderFromFollowers + "?providerId=$providerId",
      returnType: ReturnType.Type,
      methodType: MethodType.Delete,
      json: {"providerId": providerId},
      showLoader: true,
    );
    return (data != null);
  }

  Future<List<CityModel>> getCities() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<CityModel>(context).callApi(
      name: ApiNames.listCity +"?lang=$lang",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => CityModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<List<MessageModel>> getChatMessages(
      String orderId, int pageNumber) async {
    final data = await GenericHttp<MessageModel>(context).callApi(
        name: ApiNames.listProviders,
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        json: {
          "OrderId": orderId,
          "page_number": pageNumber,
        },
        returnDataFun: (json) => json["data"],
        toJsonFunc: (json) => MessageModel.fromJson(json));
    return (data);
  }

  Future<String> uploadFile(File file) async {
    print('=============> file $file');
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.uploadFile,
      returnType: ReturnType.Type,
      json: <String, dynamic>{
        'File': file,
      },
      showLoader: false,
      methodType: MethodType.Post,
      returnDataFun: (data) => data['data'],
    );
    return data;
  }

  Future<List<MessageModel>> getHomeMsg(int pageNumber) async {
    final data = await GenericHttp<MessageModel>(context).callApi(
        name: ApiNames.listHomeMessages + "?pageNumber=$pageNumber",
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        returnDataFun: (json) => json["data"],
        showLoader: false,
        toJsonFunc: (json) => MessageModel.fromJson(json));
    return (data);
  }

  Future<bool> addRate(String providerId, String comment, double rate, int orderId) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addRateDeleget,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      json: {
        'comment': comment,
        'providerId': providerId,
        'userName': context.read<UserCubit>().state.model.customerModel?.userName,
        'rate': rate,
        'orderId': orderId,
      },
      showLoader: true,
    );
    return (data != null);
  }

}
