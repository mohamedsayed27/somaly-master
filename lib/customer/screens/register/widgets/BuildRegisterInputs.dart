part of 'RegisterWidgetsImports.dart';

class BuildRegisterInputs extends StatelessWidget {
  final RegisterData data;
  const BuildRegisterInputs({required this.data});

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
            BlocConsumer<LocationCubit, LocationState>(
              bloc: data.locationCubit,
              listener: (context, state) {
                data.location.text = state.model?.address ?? "";
              },
              builder: (context, state) {
                return GenericTextField(
                  fieldTypes: FieldTypes.clickable,
                  label: "${tr(context, "address")}",
                  controller: data.location,
                  validate: (value) => value!.validateEmpty(context),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  onTab: () => data.onLocationClick(context),
                  // onSubmit: () => loginData.userLogin(context),
                );
              },
            ),
            // GenericTextField(
            //   fieldTypes: FieldTypes.password,
            //   label: tr(context, "password"),
            //   controller: data.password,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   action: TextInputAction.next,
            //   type: TextInputType.text,
            //   validate: (value) => value!.validatePassword(context),
            // ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: data.showPassCubit,
              builder: (_, state) {
                return GenericTextField(
                  fieldTypes: state.data == true
                      ? FieldTypes.password
                      : FieldTypes.normal,
                  label: tr(context, "password"),
                  hintColor: Colors.white70,
                  controller: data.password,
                  validate: (value) => value!.validatePassword(context),
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.data ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => data.showPassCubit.onUpdateData(!state.data),
                  ),
                );
              },
            ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: data.showConfirmPassCubit,
              builder: (_, state) {
                return GenericTextField(
                  fieldTypes: state.data == true
                      ? FieldTypes.password
                      : FieldTypes.normal,
                  label: tr(context, "password"),
                  hintColor: Colors.white70,
                  controller: data.confirmPassword,
                  validate: (value) => value!.validatePasswordConfirm(context, pass: data.password.text),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.data ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => data.showConfirmPassCubit.onUpdateData(!state.data),
                  ),
                );
              },
            ),
            // GenericTextField(
            //   fieldTypes: FieldTypes.password,
            //   label: tr(context, "confirmPassword"),
            //   controller: data.confirmPassword,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   action: TextInputAction.done,
            //   type: TextInputType.text,
            //   validate: (value) => value!.validatePasswordConfirm(context, pass: data.password.text),
            // ),
          ],
        ),
      ),
    );
  }
}
