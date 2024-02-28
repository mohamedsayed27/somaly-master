part of 'ResetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;

  const BuildFormInputs(
      {required this.resetPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            label: tr(context, "code"),
            controller: resetPasswordData.code,
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: resetPasswordData.showPassword,
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
                      resetPasswordData.showPassword.onUpdateData(!state.data),
                ),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: tr(context, "password"),
                controller: resetPasswordData.newPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.text,
                enableBorderColor: MyColors.grey,
                action: TextInputAction.next,
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: resetPasswordData.confirmShowPassword,
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
                  onPressed: () => resetPasswordData.confirmShowPassword
                      .onUpdateData(!state.data),
                ),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: tr(context, "confirmPassword"),
                controller: resetPasswordData.confirmNewPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: resetPasswordData.newPassword.text),
                type: TextInputType.text,
                enableBorderColor: MyColors.grey,
                action: TextInputAction.done,
              );
            },
          ),
        ],
      ),
    );
  }
}
