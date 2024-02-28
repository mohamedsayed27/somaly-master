part of 'ProviderRepoImports.dart';

class ProviderAuthMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  ProviderAuthMethods(this.context);

  Future<void> providerRegister(ProRegisterModel model) async {
    String? _token = await messaging.getToken();
    model.deviceId = _token;
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.proRegister,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showToastNotification("${tr(context, "loginSuccessfully")}");
      AutoRouter.of(context).push(ActiveAccountRoute(userId: data["id"]));
    }
  }

  Future<ProviderModel> getProvDetails() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<ProviderModel>(context).callApi(
      name: ApiNames.getDataOfProvider +"?lang=$lang",
      returnType: ReturnType.Model,
      showLoader: false,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => ProviderModel.fromJson(json),
      methodType: MethodType.Get,
    ) as ProviderModel;
  }

  Future<List<MultiDropDownModel>> getMainCategories(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<MultiDropDownModel>(context).callApi(
        name: ApiNames.listMainService +"?lang=$lang",
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        toJsonFunc: (json) => MultiDropDownModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        refresh: refresh);
  }

  Future<List<DropDownModel>> getMainServices(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<DropDownModel>(context).callApi(
        name: ApiNames.listMainService +"?lang=$lang",
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        toJsonFunc: (json) => DropDownModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        refresh: refresh);
  }

  Future<List<MultiDropDownModel>> getSubCat(List<int> mainCatId) async {
    return await GenericHttp<MultiDropDownModel>(context).callApi(
      name: ApiNames.listSubService,
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      json: {
        "servIds": mainCatId,
      },
      toJsonFunc: (json) => MultiDropDownModel.fromJson(json),
      returnDataFun: (data) => data,
      showLoader: false,
    );
  }

  Future<bool> updateProviderProfile(UpdateProviderProfileModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateDataProv,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: "${tr(context, "editedSuccsess")}");
      AutoRouter.of(context).popAndPush(ProHomeRoute(index: 4));
      if (data != null) {
        var provModel = context.read<UserCubit>();
        provModel.state.model.providerModel = ProviderModel.fromJson(data);
        Utils.saveUserData(provModel.state.model);
        provModel.state.model.token = GlobalState.instance.get("token");
        provModel.onUpdateUserData(provModel.state.model);
        return true;
      }
    }
    return data != null;
  }
}
