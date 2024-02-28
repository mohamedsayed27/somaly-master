part of 'VisaPaymentWidgetsImports.dart';

class BuildInputForm extends StatelessWidget {
  const BuildInputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.name,
          action: TextInputAction.next,
          hint: "${tr(context, "CardholderName")}",
          margin: EdgeInsets.symmetric(vertical: 10),
          validate: (value) => value!.validateEmpty(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.number,
          action: TextInputAction.next,
          hint: "${tr(context, "cardNumber")}",
          margin: EdgeInsets.symmetric(vertical: 10),
          validate: (value) => value!.validateEmpty(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.datetime,
          action: TextInputAction.next,
          hint: "${tr(context, "endDate")}",
          suffixIcon: Icon(MyFlutterApp.calendar, size: 25),
          margin: EdgeInsets.symmetric(vertical: 10),
          validate: (value) => value!.validateEmpty(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.number,
          action: TextInputAction.done,
          hint: "CVV",
          margin: EdgeInsets.symmetric(vertical: 10),
          validate: (value) => value!.validateEmpty(context),
        ),
      ],
    );
  }
}
