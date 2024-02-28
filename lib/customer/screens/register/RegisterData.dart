part of 'RegisterImports.dart';

class RegisterData {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final GenericBloc<File> imageCubit = GenericBloc<File>(File(""));
  final GenericBloc<bool> termsCubit = GenericBloc(false);
  final GenericBloc<bool> showPassCubit = GenericBloc(true);
  final GenericBloc<bool> showConfirmPassCubit = GenericBloc(true);
  LocationModel? locationModel;
  final LocationCubit locationCubit = LocationCubit();

  // functions

  onLocationClick(BuildContext context) async {
    var _loc = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 24.774265,
      lng: _loc?.longitude ?? 46.738586,
      address: "",
    ));
    EasyLoading.dismiss();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (cxt) => BlocProvider.value(
          value: locationCubit,
          child: LocationAddress(),
        ),
      ),
    );
  }

  getImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  setCustomerRegister(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (imageCubit.state.data.path == "") {
        return CustomToast.showToastNotification(
            "${tr(context, "insertPhoto")}");
      }
      if (termsCubit.state.data == false) {
        return CustomToast.showToastNotification(
            "${tr(context, "insertAgreeTerms")}");
      }
      btnKey.currentState?.animateForward();
      RegisterModel model = RegisterModel(
        userName: name.text,
        imgProfile: imageCubit.state.data,
        phone: phone.text,
        password: password.text,
        deviceId: await messaging.getToken() ?? "",
        deviceType: Platform.isIOS ? "ios" : "android",
        projectName: 'الصميلي',
        lat: locationCubit.state.model?.lat.toString(),
        lng: locationCubit.state.model?.lng.toString(),
        location: locationCubit.state.model?.address ?? "",
      );
      await CustomerRepository(context).userRegister(model);
      btnKey.currentState?.animateReverse();
    }
  }
}
