part of 'ProOrderDetailsWidgetsImports.dart';

class BuildProOrderDetailsInfo extends StatelessWidget {
  final OrderDetailsModel model;

  const BuildProOrderDetailsInfo({required this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildProOrdersDetailsInfoItem(
          title: "${tr(context, "OrderNumber")} :  ",
          subTitle: "${model.orderId}",
        ),
        BuildProOrdersDetailsInfoItem(
          title:" ${tr(context, "orderDate")} : ",
          subTitle: "${model.date}",
        ),
        BuildProOrdersDetailsInfoItem(
          title: "${tr(context, "city")} : ",
          subTitle: model.cityName,
        ),
        BuildProOrdersDetailsInfoItem(
          title: "${tr(context, "orderDetails")} : ",
          subTitle: model.info,
        ),
      ],
    );
  }
}
