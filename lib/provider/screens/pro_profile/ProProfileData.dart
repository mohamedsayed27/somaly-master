part of 'ProProfileImports.dart';

class ProProfileData {
  final GenericBloc<File?> imgCubit = GenericBloc<File?>(null);
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController mail = new TextEditingController();
  final TextEditingController whatsNumber = new TextEditingController();
  final TextEditingController bankAccountNumber = new TextEditingController();
  final TextEditingController commercialRegister = new TextEditingController();
  final TextEditingController id = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final TextEditingController aboutU = new TextEditingController();
  final GenericBloc<File?> commercialRegisterImgCubit = new GenericBloc(null);
  final GenericBloc<File?> idImgCubit = new GenericBloc(null);
  final GlobalKey<DropdownSearchState> mainKey = new GlobalKey();
  final GlobalKey<DropdownSearchState> subKey = new GlobalKey();
  final LocationCubit locationCubit = LocationCubit();
  DropDownModel? selectedMainDepartmentsModel;
  DropDownModel? selectedSubDepartmentsModel;
  final GenericBloc<List<MultiDropDownModel>> mainCatsCubit =
      new GenericBloc([]);
  final GenericBloc<List<MultiDropDownModel>> subCatsCubit =
      new GenericBloc([]);
  double? lat;
  double? lng;
  int? mainCatId;
  List<int>? mainCats;
  List<int>? subCats;
  final UserCubit userCubit = UserCubit();

  //function
  // void setSelectMainCat(DropDownModel? model) {
  //   selectedMainDepartmentsModel = model;
  //   mainCatId = model!.id;
  // }

  getData(BuildContext context) async {
    final data = await ProviderRepository(context).getProvDetails();
    var provModel = context.read<UserCubit>();
    provModel.state.model.providerModel = data;
    Utils.saveUserData(provModel.state.model);
    provModel.onUpdateUserData(provModel.state.model);
    mainCatsCubit.onUpdateData(data.mainCat ?? []);
    subCatsCubit.onUpdateData(data.listCat ?? []);
    userCubit.onUpdateUserData(provModel.state.model);
  }

  Future<List<MultiDropDownModel>> getCategories(BuildContext context) async {
    List<MultiDropDownModel> allCats =
        await ProviderRepository(context).getMainCategories(false);
    var prov = context.read<UserCubit>().state.model.providerModel!;
    var selected = allCats
        .where((e) => prov.mainCat!.map((item) => item.id).contains(e.id))
        .toList();
    mainCatsCubit.onUpdateData(selected);
    return allCats;
  }

  Future<List<MultiDropDownModel>> getActivities(BuildContext context) async {
    List<MultiDropDownModel> allSubCats =
        await ProviderRepository(context).getSubCat([]);
    var prov = context.read<UserCubit>().state.model.providerModel!;
    var selected = allSubCats
        .where((e) => prov.listCat!.map((item) => item.id).contains(e.id))
        .toList();
    subCatsCubit.emit(GenericInitialState(selected));
    return allSubCats;
  }

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
      imgCubit.onUpdateData(image);
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

  initProfileData(BuildContext context) {
    var user = context.read<UserCubit>().state.model.providerModel;
    print("===================> $user");
    phone.text = user?.phone ?? "";
    name.text = user?.userName ?? "";
    mail.text = user?.email ?? "";
    aboutU.text = user?.info ?? "";
    id.text = user?.indentityImg ?? "";
    whatsNumber.text = user?.whatsup ?? "";
    bankAccountNumber.text = user?.bankAccountNumber ?? "";
    location.text = user?.location ?? "";
    commercialRegister.text = user?.commercialRegisterImg ?? "";
    mainCatsCubit.onUpdateData(user?.mainCat ?? []);
    subCatsCubit.emit(GenericInitialState(user?.listCat ?? []));
  }

  setUpdateProfile(BuildContext context) async {
    if (subCatsCubit.state.data.isEmpty) {
      CustomToast.showSimpleToast(msg: "برجاء تحديد الأقسام");
      return;
    }
    // if (formKey.currentState!.validate()) {
      btnKey.currentState?.animateForward();
      var providerProfileModel =
          UpdateProviderProfileModel(
        userName: name.text,
        email: mail.text,
        password: password.text,
        bankAccountNumber: bankAccountNumber.text,
        commercialRegisterImg: commercialRegisterImgCubit.state.data,
        imgProfile: imgCubit.state.data,
        info: aboutU.text,
        indentityImg: idImgCubit.state.data,
        phone: phone.text,
        lat: locationCubit.state.model?.lat.toString(),
        lng: locationCubit.state.model?.lng.toString(),
        location: locationCubit.state.model?.address ?? "",
        whatsUp: whatsNumber.text,
        idsSubCat: json.encode(subCatsCubit.state.data.map((e) => e.id).toList()),
      );
      await ProviderRepository(context).updateProviderProfile(providerProfileModel);
      btnKey.currentState?.animateReverse();
    // }
  }
}
