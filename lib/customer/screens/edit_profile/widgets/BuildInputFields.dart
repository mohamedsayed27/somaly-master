part of 'EditProfileWidgetsImports.dart';

class BuildInputFields extends StatelessWidget {
  final EditProfileData data;

  const BuildInputFields({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: data.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "${tr(context, "userName")}",
              color: MyColors.black,
              size: 12,
            ),
            GenericTextField(
              controller: data.name,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.name,
              action: TextInputAction.next,
              hint: "${tr(context, "userName")}",
              suffixIcon: Icon(MyFlutterApp.edit, size: 20),
              margin: EdgeInsets.symmetric(vertical: 10),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "${tr(context, "phone")}",
              color: MyColors.black,
              size: 12,
            ),
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              action: TextInputAction.next,
              hint: "${tr(context, "phone")}",
              controller: data.phone,
              suffixIcon: Icon(MyFlutterApp.edit, size: 20),
              margin: EdgeInsets.symmetric(vertical: 10),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "${tr(context, "address")}",
              color: MyColors.black,
              size: 12,
            ),
            BlocConsumer<LocationCubit, LocationState>(
              bloc: data.locationCubit,
              listener: (context, state) {
                data.location.text = state.model?.address ?? "";
                data.lat = state.model!.lat;
                data.lng = state.model!.lng;
              },
              builder: (context, state) {
                return GenericTextField(
                  suffixIcon: Icon(MyFlutterApp.edit),
                  fieldTypes: FieldTypes.clickable,
                  hint: "${tr(context, "address")}",
                  controller: data.location,
                  validate: (value) => value!.noValidate(),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  onTab: () => data.onLocationClick(context),
                  // onSubmit: () => loginData.userLogin(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
