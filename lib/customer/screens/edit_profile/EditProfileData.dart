part of 'EditProfileImports.dart';

class EditProfileData {
  GenericBloc<File?> imageCubit = GenericBloc(null);
  final TextEditingController name = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final LocationCubit locationCubit = LocationCubit();
  double? lat;
  double? lng;
  //functions

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

  initProfileData(BuildContext context) {
    var user = context.read<UserCubit>().state.model.customerModel;
    print("===================> ${user?.location}");
    phone.text = user?.phone ?? "";
    name.text = user?.userName ?? "";
    location.text = user?.location ?? "";
  }

  setUpdateProfile(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState?.animateForward();
      UpdateUserProfileModel updateUserProfileModel = UpdateUserProfileModel(
        phone: phone.text,
        img: imageCubit.state.data,
        userName: name.text,
        lat: locationCubit.state.model?.lat.toString(),
        lng: locationCubit.state.model?.lng.toString(),
        location: locationCubit.state.model?.address ?? "",
      );
      await CustomerRepository(context)
          .updateUserProfile(updateUserProfileModel);
      btnKey.currentState?.animateReverse();
    }
  }
}
