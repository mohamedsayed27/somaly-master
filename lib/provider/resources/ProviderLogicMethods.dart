part of 'ProviderRepoImports.dart';

class ProviderLogicMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  ProviderLogicMethods(this.context);

  Future<NewOrdersModel> getNewOrders(bool refresh) async {
    return await GenericHttp<NewOrdersModel>(context).callApi(
        name: ApiNames.listAdsNewOrderForProvider,
        returnType: ReturnType.Model,
        methodType: MethodType.Get,
        toJsonFunc: (json) => NewOrdersModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: false,
        refresh: refresh) as NewOrdersModel;
  }

  Future<List<OrderModel>> getCurrentOrders(bool refresh) async {
    return await GenericHttp<OrderModel>(context).callApi(
        name: ApiNames.listCurrentOrderForProvider,
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        toJsonFunc: (json) => OrderModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: false,
        refresh: refresh) as List<OrderModel>;
  }

  Future<List<OrderModel>> getFinishedOrders(bool refresh) async {
    return await GenericHttp<OrderModel>(context).callApi(
        name: ApiNames.listEndedOrderForProvider,
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        toJsonFunc: (json) => OrderModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: false,
        refresh: refresh) as List<OrderModel>;
  }

  Future<OrderDetailsModel> getOrderInfo(int orderId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<OrderDetailsModel>(context).callApi(
      name: ApiNames.getOrderInfoForProvider + "?orderId=$orderId&lang=$lang",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      toJsonFunc: (json) => OrderDetailsModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );
  }

  Future<void> sendOfferPrice(int orderId, int price) async {
    Map<String, dynamic> body = {"orderId": orderId, "price": price};
    var data = await GenericHttp<OrderDetailsModel>(context).callApi(
      name: ApiNames.sendOffer,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      json: body,
      toJsonFunc: (json) => OrderDetailsModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showToastNotification("${tr(context, "offerSendSuccsess")}");
      AutoRouter.of(context).popAndPush(ProDoneRoute());
    }
  }

  Future<bool> endOrder(int orderId) async {
    Map<String, dynamic> body = {
      "orderId": orderId,
    };
    var data = await GenericHttp<OrderDetailsModel>(context).callApi(
      name: ApiNames.endedOrder,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      json: body,
      toJsonFunc: (json) => OrderDetailsModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );

    return data != null;
  }

  Future<bool> removeFollower(String userId) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.removeUserFromFollowers + "?userId=$userId",
      returnType: ReturnType.Type,
      methodType: MethodType.Delete,
      showLoader: true,
    );
    if (data != null) {
      CustomToast.showToastNotification(tr(context, "deleteSuccess"));
      return true;
    } else {
      return false;
    }
  }

  Future<List<NotifyModel>> getNotifyProvider() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<NotifyModel>(context).callApi(
      name: ApiNames.listOfNotifyProvider +"?lang=$lang",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (json) => NotifyModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<WalletModel> getProviderWallet() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<WalletModel>(context).callApi(
      name: ApiNames.provWallet +'?lang=$lang',
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      toJsonFunc: (json) => WalletModel.fromJson(json),
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<bool> sendPayOutRequest(String orderIds) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final data = await GenericHttp<WalletModel>(context).callApi(
      name: ApiNames.payOutRequest +'?orderIds=$orderIds&lang=$lang',
      returnType: ReturnType.Type,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
    );
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

}
