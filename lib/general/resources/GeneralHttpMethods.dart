part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String phone, String pass, int typeUser) async {
    String? _token = await messaging.getToken();
    Map<String, dynamic> body = {
      "phone": "$phone",
      "password": "$pass",
      "deviceId": "$_token",
      "deviceType": Platform.isIOS ? "ios" : "android",
      "projectName": "خدماتنا",
      "typeUser": typeUser
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      json: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data,
      // toJsonFunc: (json) => jsonUserModel.fromJson(json),
      showLoader: false,
    );

    return Utils.manipulateLoginData(context, data, _token ?? "");
  }

  Future<void> sendCode(int code, String userId) async {
    Map<String, dynamic> body = {"code": code, "userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.sendCode,
      json: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Patch,
    );
    if (data != null) {
      CustomToast.showToastNotification(tr(context, "activeSuccess"));
      AutoRouter.of(context).popUntilRouteWithName(LoginRoute.name);
      print("=========Done========");
    }
  }

  Future<void> resendCode(String userId) async {
    Map<String, dynamic> body = {"userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode,
      json: body,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: tr(context, "sendCodeSuccess"));
    }
  }

  Future<String?> terms() async {
    var type = context.read<UserCubit>().state.model.typeUser;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<dynamic>(context).callApi(
      name: type == 2 ? ApiNames.termsProvider +"?lang=$lang"
          : ApiNames.termsClient +"?lang=$lang",
      returnType: ReturnType.Type,
      showLoader: false,
      returnDataFun: (data) => data["condtions"],
      methodType: MethodType.Get,
    );
  }

  Future<String?> about() async {
    var type = context.read<UserCubit>().state.model.typeUser;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<dynamic>(context).callApi(
      name: type == 2 ? ApiNames.aboutProvider +"?lang=$lang"
          : ApiNames.aboutClient +"?lang=$lang" ,
      returnType: ReturnType.Type,
      showLoader: false,
      returnDataFun: (data) => data["aboutUs"],
      methodType: MethodType.Get,
    );
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    var type = context.read<UserCubit>().state.model.typeUser;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return await GenericHttp<QuestionModel>(context).callApi(
            name: type == 2
                ? ApiNames.listQuestionsForProvider +"?lang=$lang"
                : ApiNames.listQuestionsForClient +"?lang=$lang",
            returnType: ReturnType.List,
            showLoader: false,
            methodType: MethodType.Get,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => QuestionModel.fromJson(json))
        as List<QuestionModel>;
  }

  Future<List<FollowerModel>> getListFollower(bool refresh) async {
    var type = context.read<UserCubit>().state.model.typeUser;
    return await GenericHttp<FollowerModel>(context).callApi(
            name: type == 1
                ? ApiNames.listProviderFollowers
                : ApiNames.listUserFollowers,
            returnType: ReturnType.List,
            showLoader: false,
            refresh: refresh,
            methodType: MethodType.Get,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => FollowerModel.fromJson(json))
        as List<FollowerModel>;
  }

  Future<List<AllChatsModel>> getAllChats(bool refresh) async {
    return await GenericHttp<AllChatsModel>(context).callApi(
            name: ApiNames.listUsersMyChat,
            returnType: ReturnType.List,
            showLoader: false,
            refresh: refresh,
            methodType: MethodType.Post,
            returnDataFun: (data) => data["data"],
            toJsonFunc: (json) => AllChatsModel.fromJson(json))
        as List<AllChatsModel>;
  }

  Future<List<MessageModel>> getChatMessages(
      int orderId, int pageNumber) async {
    final data = await GenericHttp<MessageModel>(context).callApi(
        name: ApiNames.listMessagesUser +
            "?OrderId=$orderId&pageNumber=$pageNumber",
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        returnDataFun: (json) => json["data"],
        showLoader: false,
        toJsonFunc: (json) => MessageModel.fromJson(json));
    return (data);
  }

  Future<bool> changeLanguage(String lang) async {
    Map<String, dynamic> body = {
      "language": lang,
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.changeLanguage,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Patch,
    );
    return (data != null);
  }

  Future<void> changePassword(String oldPass, String newPass) async {
    Map<String, dynamic> body = {
      "oldPassword": oldPass,
      "newPassword": newPass,
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.ChangePassword,
      json: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: tr(context, "changePassSuccess"));
      Navigator.of(context).pop();
    }
  }

  Future<bool> switchNotify() async {
    var notify = context.read<UserCubit>().state.model.closeNotify;
    Map<String, dynamic> body = {"notify": notify};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.switchNotify,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
      json: body,
    );
    return (data != null);
  }

  Future<String?> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null) ? data["userId"] : null;
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    Map<String, dynamic> body = {
      "userId": "$userId",
      "code": "$code",
      "newPassword": "$pass",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> contactUs(String? name, String? mail, String? message) async {
    var type = context.read<UserCubit>().state.model.typeUser;
    Map<String, dynamic> body = {
      "userName": "$name",
      "email": "$mail",
      "msg": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: type == 2 ? ApiNames.contactUsProvider : ApiNames.contactUsClient,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return data != null;
  }

  Future<void> logOut() async {
    String? _token = await Utils.getDeviceId();
    Map<String, dynamic> body = {
      "deviceId": _token,
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.logout,
      json: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Delete,
      showLoader: true,
    );
    if (data != null) {
      // CustomToast.showSimpleToast(msg: tr(context, "logoutSuccess"));
      CustomToast.showSimpleToast(msg: "${tr(context, "logoutSuccess")}");
      EasyLoading.dismiss().then((value) {
        Utils.clearSavedData();
        AutoRouter.of(context).popUntilRoot();
        AutoRouter.of(context).push(SelectLangRoute());
      });
    }
  }
}
