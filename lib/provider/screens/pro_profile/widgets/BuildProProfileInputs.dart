part of 'ProProfileWidgetsImports.dart';

class BuildProProfileInputs extends StatelessWidget {
  final ProProfileData data;

  const BuildProProfileInputs({required this.data});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: data.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "userName"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: data.name,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            hint: tr(context, "userName"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "mobileNumber"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            controller: data.phone,
            action: TextInputAction.next,
            hint: tr(context, "mobileNumber"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "mail"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            controller: data.mail,
            action: TextInputAction.next,
            hint: tr(context, "mail"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "address"),
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
                hint: tr(context, "address"),
                controller: data.location,
                validate: (value) => value!.validateEmpty(context),
                type: TextInputType.text,
                action: TextInputAction.done,
                onTab: () => data.onLocationClick(context),
                // onSubmit: () => loginData.userLogin(context),
              );
            },
          ),
          MyText(
            title: tr(context, "bankAccountNumber"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            controller: data.bankAccountNumber,
            action: TextInputAction.next,
            hint: tr(context, "bankAccountNumber"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "aboutU"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            max: 3,
            hint: tr(context, "aboutU"),
            controller: data.aboutU,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.noValidate(),
          ),
          MyText(
            title: tr(context, "commercialRegistration"),
            color: MyColors.black,
            size: 12,
          ),
          // GenericTextField(
          //   fieldTypes: FieldTypes.normal,
          //   max: 3,
          //   hint: tr(context, "commercialRegistrationNo"),
          //   controller: data.commercialRegister,
          //   margin: const EdgeInsets.symmetric(vertical: 10),
          //   action: TextInputAction.next,
          //   type: TextInputType.text,
          //   validate: (value) => value!.noValidate(),
          // ),
          BuildEditCommercialRegistrationImg(
            data: data,
          ),
          MyText(
            title: tr(context, "id"),
            color: MyColors.black,
            size: 12,
          ),
          BuildProProfileIds(
            data: data,
          ),
        ],
      ),
    );
  }
}
