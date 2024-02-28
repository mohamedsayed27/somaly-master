part of 'ProSendOfferWidgetsImports.dart';

class BuildProSendOfferInputs extends StatelessWidget {
  final ProSendOfferData proSendOfferData;

  const BuildProSendOfferInputs({required this.proSendOfferData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          key: proSendOfferData.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: tr(context, "offerPrice"),
                color: MyColors.primary,
                size: 12,
              ),
              GenericTextField(
                fieldTypes: FieldTypes.normal,
                type: TextInputType.number,
                action: TextInputAction.done,
                validate: (value) => value!.validateEmpty(context),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                controller: proSendOfferData.offerController,
                hint: tr(context, "enterPriceHere"),
              ),
            ],
          )),
    );
  }
}
