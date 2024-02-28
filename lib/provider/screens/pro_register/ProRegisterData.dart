part of 'ProRegisterImports.dart';

class ProRegisterData {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController mail = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final TextEditingController whatsNumber = new TextEditingController();
  final TextEditingController bankAccountNumber = new TextEditingController();
  final TextEditingController commercialRegister = new TextEditingController();
  final TextEditingController id = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController aboutU = new TextEditingController();
  final GenericBloc<File?> profileImageCubit = GenericBloc(null);
  final GenericBloc<File?> idImgCubit = new GenericBloc(null);
  final GenericBloc<bool> showPassword = new GenericBloc(false);
  final GenericBloc<bool> showConfirmPassword = new GenericBloc(false);
  final GenericBloc<File?> commercialRegisterImgCubit = new GenericBloc(null);
  final GenericBloc<bool> termsCubit = GenericBloc(false);
  final GlobalKey<DropdownSearchState> mainKey = new GlobalKey();
  final GlobalKey<DropdownSearchState> subKey = new GlobalKey();
  final GenericBloc<List<int>> dropDownCubit = new GenericBloc([]);
  LocationModel? locationModel;
  final LocationCubit locationCubit = LocationCubit();
  DropDownModel? selectedMainDepartmentsModel;
  DropDownModel? selectedSubDepartmentsModel;
  int? mainCatId;
  String? subCat;
  List<int> subCats = [];

  // functions

  // void setSelectMainCat(DropDownModel? model) {
  //   selectedMainDepartmentsModel = model;
  //   mainCatId = model!.id;
  //   dropDownCubit.onUpdateData(mainCatId!);
  // }

  void setSelectSubCat(DropDownModel? model) {
    selectedSubDepartmentsModel = model;
  }

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
      profileImageCubit.onUpdateData(image);
    }
  }

  setIdImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      idImgCubit.onUpdateData(image);
    }
  }

  setCommercialRegisterImg() async {
    var image = await Utils.getImage();
    if (image != null) {
      commercialRegisterImgCubit.onUpdateData(image);
    }
  }

  setProviderRegister(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (profileImageCubit.state.data == null) {
        return CustomToast.showToastNotification(tr(context, 'insertPhoto'));
      }
      // if (idImgCubit.state.data == null) {
      //   return CustomToast.showToastNotification("من فضلك ادخل صوره الهوية");
      // }
      // if (commercialRegisterImgCubit.state.data == null) {
      //   return CustomToast.showToastNotification(
      //       "من فضلك ادخل صوره السجل التجاري");
      // }
      if (termsCubit.state.data == false) {
        return CustomToast.showToastNotification(tr(context, 'insertAgreeTerms'));
      }
      btnKey.currentState!.animateForward();
      ProRegisterModel model = new ProRegisterModel(
          userName: name.text,
          deviceId: await messaging.getToken(),
          deviceType: Platform.isIOS ? "ios" : "android",
          email: mail.text,
          projectName: "الصميلي",
          phone: phone.text,
          lang: context.read<LangCubit>().state.locale.languageCode,
          imgProfile: profileImageCubit.state.data,
          idsSubCat: json.encode(subCats),
          lat: "${locationCubit.state.model?.lat}",
          lng: "${locationCubit.state.model?.lng}",
          location: "${locationCubit.state.model?.address}",
          bankAccountNumber: bankAccountNumber.text,
          commercialRegisterImg: commercialRegisterImgCubit.state.data,
          indentityImg: idImgCubit.state.data,
          info: aboutU.text,
          whatsUp: whatsNumber.text,
          password: password.text);
      await ProviderRepository(context).providerRegister(model);
      btnKey.currentState?.animateReverse();
    }
  }
}
