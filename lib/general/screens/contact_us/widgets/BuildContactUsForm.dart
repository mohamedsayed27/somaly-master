part of 'ContactUsWidgetsImports.dart';

class BuildContactUsForm extends StatelessWidget {
  final ContactUsData contactUsData;

  const BuildContactUsForm({required this.contactUsData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactUsData.formKey,
      child: Column(
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            controller: contactUsData.name,
            validate: (value) => value!.validateEmpty(context),
            label: tr(context, "name"),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            controller: contactUsData.mail,
            validate: (value) => value!.validateEmail(context),
            label: tr(context, "mail"),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            type: TextInputType.multiline,
            max: 3,
            action: TextInputAction.newline,
            controller: contactUsData.msg,
            validate: (value) => value!.validateEmpty(context),
            label: tr(context, "msg"),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
