part of 'MyOrdersWidgetsImports.dart';

class BuildOrderCard extends StatelessWidget {
  final OrderModel model;
  const BuildOrderCard({
    required this.model,
  });

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
      openBuilder: (context, action) => OrderDetails(orderId: model.orderId),
      closedBuilder: (context, action) => Container(
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
                  url: model.img,
                  fit: BoxFit.fill,
                  height: 80,
                  width: 80,
                  borderRadius: BorderRadius.circular(10),
                ),
                // Visibility(
                //   visible: replied ?? false,
                //   child: Container(
                //     alignment: Alignment.center,
                //     width: 80,
                //     height: 25,
                //     decoration: BoxDecoration(
                //       color: MyColors.primary,
                //       borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(10),
                //         bottomRight: Radius.circular(10),
                //         topLeft: Radius.circular(5),
                //         topRight: Radius.circular(5),
                //       ),
                //     ),
                //     child: MyText(
                //       title: "تم الرد",
                //       color: MyColors.white,
                //       size: 11,
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(width: 5),
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
                        title: model.orderId.toString(),
                        color: MyColors.blackOpacity,
                        size: 12,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          MyText(
                            title: model.date,
                            color: MyColors.blackOpacity,
                            size: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
