part of 'ProRegisterWidgetsImports.dart';

class BuildProRegisterInputs extends StatelessWidget {
  final ProRegisterData data;

  const BuildProRegisterInputs({required this.data});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: data.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              label: tr(context, "name"),
              controller: data.name,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              validate: (value) => value!.validateEmpty(context),
            ),
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              label: tr(context, "phone"),
              controller: data.phone,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.phone,
              validate: (value) => value!.validateEmpty(context),
            ),
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              label: tr(context, "mail"),
              controller: data.mail,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              validate: (value) => value!.noValidate(),
            ),
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              label: tr(context, "whatsNumber"),
              controller: data.whatsNumber,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.number,
              validate: (value) => value!.validateEmpty(context),
            ),
            BlocConsumer<LocationCubit, LocationState>(
              bloc: data.locationCubit,
              listener: (context, state) {
                data.location.text = state.model?.address ?? "";
              },
              builder: (context, state) {
                return GenericTextField(
                  fieldTypes: FieldTypes.clickable,
                  label: tr(context, "address"),
                  controller: data.location,
                  validate: (value) => value!.validateEmpty(context),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  onTab: () => data.onLocationClick(context),
                  // onSubmit: () => loginData.userLogin(context),
                );
              },
            ),
            GenericTextField(
              fieldTypes: FieldTypes.normal,
              label:
                  "${tr(context, "bankAccountNumber")} (${tr(context, 'optional')})",
              controller: data.bankAccountNumber,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.number,
              validate: (value) => value!.noValidate(),
            ),
            BuildCommercialRegistrationImg(
              data: data,
            ),
            BuildIdImage(
              data: data,
            ),
            GenericTextField(
              fieldTypes: FieldTypes.rich,
              max: 3,
              label: tr(context, "aboutU"),
              controller: data.aboutU,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              validate: (value) => value!.validateDropDown(context),
            ),
            // DropdownTextField<DropDownModel>(
            //   label: 'الاقسام',
            //   // dropKey: data.mainKey,
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   onChange: data.setSelectMainCat,
            //   finData: (filter) async =>
            //   await ProviderRepository(context).getMainCategories(true),
            //   validate: (DropDownModel? value) =>
            //       value?.validateDropDown(context),
            //   useName: true,
            // ),
            MultiDropDownField<MultiDropDownModel>(
              selectedItems: [],
              label: tr(context, "categories"),
              title: tr(context, "categories"),
              onConfirm: (List<MultiDropDownModel>? model) {
                if (model != null) {
                  var ids = model.map((e) => e.id).toList();
                  data.dropDownCubit.onUpdateData(ids);
                  print("+++++++++++++++++ list $ids");
                }
              },
              onFind: () async =>
                  await ProviderRepository(context).getMainCategories(true),
              onItemClick: (MultiDropDownModel item) {},
              fillColor: Colors.transparent,
              borderColor: MyColors.blackOpacity.withOpacity(0.4),
            ),
            SizedBox(height: 10),
            BlocBuilder<GenericBloc<List<int>>, GenericState<List<int>>>(
              bloc: data.dropDownCubit,
              builder: (context, state) {
                return MultiDropDownField<MultiDropDownModel>(
                  selectedItems: [],
                  fillColor: Colors.transparent,
                  dropkey: GlobalKey(),
                  borderColor: MyColors.blackOpacity.withOpacity(0.4),
                  title: tr(context, "subsections"),
                  label: tr(context, "subsections"),
                  onConfirm: (List<MultiDropDownModel>? model) {
                    if (model != null) {
                      data.subCats = model.map((e) => e.id).toList();
                    }
                  },
                  onFind: () async =>
                      await ProviderRepository(context).getSubCat(state.data),
                  onItemClick: (MultiDropDownModel item) {},
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: data.showPassword,
              builder: (context, state) {
                return GenericTextField(
                  suffixIcon: IconButton(
                    icon: state.data
                        ? Icon(
                            Icons.visibility,
                            color: MyColors.blackOpacity,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: MyColors.blackOpacity,
                          ),
                    focusColor: Colors.transparent,
                    onPressed: () =>
                        data.showPassword.onUpdateData(!state.data),
                  ),
                  fieldTypes:
                      state.data ? FieldTypes.password : FieldTypes.normal,
                  label: tr(context, "password"),
                  controller: data.password,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.validatePassword(context),
                  type: TextInputType.text,
                  enableBorderColor: MyColors.grey,
                  action: TextInputAction.next,
                );
              },
            ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: data.showConfirmPassword,
              builder: (context, state) {
                return GenericTextField(
                  suffixIcon: IconButton(
                    icon: state.data
                        ? Icon(
                            Icons.visibility,
                            color: MyColors.blackOpacity,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: MyColors.blackOpacity,
                          ),
                    focusColor: Colors.transparent,
                    onPressed: () =>
                        data.showConfirmPassword.onUpdateData(!state.data),
                  ),
                  fieldTypes:
                      state.data ? FieldTypes.password : FieldTypes.normal,
                  label: tr(context, "confirmPassword"),
                  controller: data.confirmPassword,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.validatePasswordConfirm(context,
                      pass: data.password.text),
                  type: TextInputType.text,
                  enableBorderColor: MyColors.grey,
                  action: TextInputAction.done,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
