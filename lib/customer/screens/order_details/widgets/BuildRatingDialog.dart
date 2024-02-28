part of 'OrderDetailsWidgetsImports.dart';

class BuildRatingDialog extends StatelessWidget {
  final OrderDetailsData orderDetailsData;
  final String providerId;

  const BuildRatingDialog(
      {required this.orderDetailsData, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return BuildCustomAlertDialog(
      title: "${tr(context, "RateDelegate")}",
      content: Container(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  minRating: 1,
                  maxRating: 5,
                  allowHalfRating: false,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: MyColors.primary,
                  ),
                  onRatingUpdate: (rating) {
                    orderDetailsData.rate = rating;
                    print(rating);
                  },
                ),
                Form(
                  key: orderDetailsData.formKey,
                  child: GenericTextField(
                    fillColor: MyColors.white,
                    fieldTypes: FieldTypes.rich,
                    max: 3,
                    hint: "${tr(context, "addUrComment")}",
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    action: TextInputAction.next,
                    type: TextInputType.text,
                    controller: orderDetailsData.comment,
                    validate: (value) => value!.validateEmpty(context),
                    enableBorderColor: MyColors.primary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      buttonTitle: '${tr(context, "save")}',
      sendButton: () => orderDetailsData.addRate(context, providerId),
    );
  }
}
