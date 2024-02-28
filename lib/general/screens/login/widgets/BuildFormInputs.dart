part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;
  final int typeUser;
  const BuildFormInputs({required this.loginData,required this.typeUser});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            label: tr(context, "phone"),
            controller: loginData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validateEmpty(context),),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: loginData.showPassCubit,
            builder: (_, state) {
              return GenericTextField(
                fieldTypes: state.data == true
                    ? FieldTypes.password
                    : FieldTypes.normal,
                label: tr(context, "password"),
                hintColor: Colors.white70,
                controller: loginData.password,
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.text,
                action: TextInputAction.done,
                onSubmit: () => loginData.userLogin(context, typeUser),
                suffixIcon: IconButton(
                  icon: Icon(
                    state.data ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => loginData.showPassCubit.onUpdateData(!state.data),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
