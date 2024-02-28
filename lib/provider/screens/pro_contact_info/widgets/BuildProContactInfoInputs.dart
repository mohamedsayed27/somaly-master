part of 'ProContactInfoWidgetsImports.dart';

class BuildProContactInfoInputs extends StatelessWidget {
  final ProContactInfoData data;

  const BuildProContactInfoInputs({required this.data});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Flexible(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          MyText(
            title: tr(context, "mobileNumber"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: data.number,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
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
            type: TextInputType.number,
            controller: data.mail,
            action: TextInputAction.next,
            hint:tr(context, "mail"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "contactOnWhats"),
            color: MyColors.black,
            size: 12,
          ),
          GenericTextField(
            margin: const EdgeInsets.symmetric(vertical: 10),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            controller: data.whatsNumber,
            action: TextInputAction.next,
            hint: tr(context, "contactOnWhats"),
            suffixIcon: Icon(MyFlutterApp.edit),
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    ));
  }
}
