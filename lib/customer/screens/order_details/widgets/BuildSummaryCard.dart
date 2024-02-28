part of 'OrderDetailsWidgetsImports.dart';

class BuildSummaryCard extends StatelessWidget {
  final OrderDetailsModel? model;

  const BuildSummaryCard({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MyColors.grey,
            blurRadius: .1,
            offset: Offset(0, .1),
            spreadRadius: .2,
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedImage(
                url: model!.userImg,
                fit: BoxFit.fill,
                height: 80,
                width: 80,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyText(
                        title: model!.userName,
                        color: MyColors.primary,
                        size: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      Visibility(
                        visible: model!.priceOffer != 0,
                        replacement: MyText(
                          title: "${tr(context, "price")} :  ${tr(context,'notSpecified')}",
                          color: Colors.red,
                          size: 12,
                        ),
                        child: MyText(
                          title: "${tr(context, "price")} :  ${model!.priceOffer}  ${tr(context, 'sar')}",
                          color: MyColors.primary,
                          size: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
