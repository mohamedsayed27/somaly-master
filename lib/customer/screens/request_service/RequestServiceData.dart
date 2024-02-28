part of 'RequestServiceImports.dart';

class RequestServicesData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final TextEditingController time = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController otherOrder = TextEditingController();
  final TextEditingController addFile = TextEditingController();
  final GenericBloc<List<File>> fileCubit = GenericBloc([]);
  final GlobalKey<DropdownSearchState> cityKey = GlobalKey();
  final GenericBloc<String> dateCubit = GenericBloc('');
  final GenericBloc<String> timeCubit = GenericBloc('');
  CityModel? cityModel;
  //Functions
  void setCity(CityModel? model) {
    cityModel = model;
  }

  setFile() async {
    var images = await Utils.getImages();
    if (images.isNotEmpty) {
      fileCubit.onUpdateData(images);
    }
  }

  void getImages() async {
    var images = await Utils.getImages();
    fileCubit.state.data.addAll(images);
    fileCubit.onUpdateData(fileCubit.state.data);
  }

  void removeImage(int index) {
    fileCubit.state.data.removeAt(index);
    fileCubit.onUpdateData(fileCubit.state.data);
  }

  void onSelectTime(BuildContext context) {
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          String timeString = DateFormat("HH:mm").format(date!);
          timeCubit.onUpdateData(timeString);
        },
        title: '${tr(context, "time")}');
  }

  void onSelectDate(BuildContext context) {
    AdaptivePicker.datePicker(
        context: context,
        onConfirm: (date) {
          String dateString = DateFormat("yyyy-MM-dd").format(date!);
          dateCubit.onUpdateData(dateString);
        },
        title: '${tr(context, "date")}');
  }

  addOrder(BuildContext context, int servId, String? providerId) async {
    if (formKey.currentState!.validate()) {
      if (fileCubit.state.data.isEmpty) {
        CustomToast.showToastNotification('${tr(context, "addPhoto")}');
        return;
      }
      if(cityModel?.id==null){
        CustomToast.showToastNotification('${tr(context, "addCity")}');
        return;
      }
      print("56666666 ${date.text} ${time.text}");
      btnKey.currentState!.animateForward();
      AddOrderModel model = AddOrderModel(
        servId: servId,
        cityId: cityModel?.id ?? 0,
        providerId: providerId,
        date: "${date.text} ${time.text}",
        info: otherOrder.text,
        img: fileCubit.state.data,
      );
      await CustomerRepository(context).addOrder(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
