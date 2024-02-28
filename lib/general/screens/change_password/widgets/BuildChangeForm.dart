part of 'ChangePassWidgetsImports.dart';

class BuildChangeForm extends StatelessWidget {
  final ChangePasswordData changePasswordData;

  const BuildChangeForm({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordData.formKey,
      child: Column(
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.password,
            label: '${tr(context, "oldPassword")}',
            controller: changePasswordData.oldPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validateEmpty(context),
            action: TextInputAction.next,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.password,
            label: '${tr(context, "newPassword")}',
            controller: changePasswordData.newPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validatePassword(context),
            action: TextInputAction.next,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.password,
            label: '${tr(context, "confirmNewPassword")}',
            controller: changePasswordData.confirmNewPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validatePasswordConfirm(context,
                pass: changePasswordData.newPassword.text),
            action: TextInputAction.done,
            onSubmit: ()=> changePasswordData.setChangePassword(context),
          ),
        ],
      ),
    );
  }
}
