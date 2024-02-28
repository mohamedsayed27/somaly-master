part of 'CustomerRepositoryImports.dart';

class CustomerAuthMethods {
  BuildContext context;

  CustomerAuthMethods(this.context);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Post Functions

  Future<bool> userRegister(RegisterModel model) async {
    String? _token = await messaging.getToken();
    model.deviceId = _token!;
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.registerClient,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showToastNotification(tr(context, "registerSuccess"));
      AutoRouter.of(context).push(ActiveAccountRoute(userId: data["id"]));
    }
    return data != null;
  }

  Future<dynamic> removeAccount() async {
    var data = await GenericHttp(context).callApi(
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      name: ApiNames.removeAccount,
      showLoader: true,
    );
    if (data != null) {
      CustomToast.showSimpleToast(
          msg: tr(context, "accountDeletedSuccessfully"));
      EasyLoading.dismiss().then(
        (value) {
          Utils.clearSavedData();
          // Phoenix.rebirth(context);
          AutoRouter.of(context).push(LoginRoute(typeUser: 1));
          print("-----\$----$data----\$-----");
        },
      );
    }
  }

  Future<void> updateUserProfile(UpdateUserProfileModel model) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateDataUser,
      json: model.toJson(),
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      showLoader: false,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: '${tr(context, "editedSuccsess")}');
      AutoRouter.of(context).pop();
      var customerModel = context.read<UserCubit>();
      customerModel.state.model.customerModel = CustomerModel.fromJson(data);
      await Utils.saveUserData(customerModel.state.model);
      customerModel.state.model.token = GlobalState.instance.get("token");
      customerModel.onUpdateUserData(customerModel.state.model);
    }
  }
}
