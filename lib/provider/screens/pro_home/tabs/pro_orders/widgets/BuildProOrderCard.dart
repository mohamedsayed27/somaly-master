part of 'ProOrdersWidgetsImports.dart';

class BuildProOrderCard extends StatelessWidget {
  final OrderModel model;

  const BuildProOrderCard({required this.model});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.white,
      middleColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => ProOrderDetails(
        orderId: model.orderId,
      ),
      closedBuilder: (context, action) => Container(
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        padding: EdgeInsets.all(7),
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
            CachedImage(
              url: model.img,
              fit: BoxFit.fill,
              height: 80,
              width: 80,
              borderRadius: BorderRadius.circular(10),
              alignment: Alignment.bottomCenter,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                    title: model.name,
                    color: MyColors.primary,
                    size: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        MyFlutterApp.location,
                        size: 12,
                        color: MyColors.blackOpacity,
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: MyText(
                          title: model.location,
                          color: MyColors.blackOpacity,
                          size: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  title: tr(context, "OrderNumber"),
                  color: MyColors.blackOpacity,
                  size: 12,
                ),
                MyText(
                  title: model.orderId.toString(),
                  color: MyColors.blackOpacity,
                  size: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
