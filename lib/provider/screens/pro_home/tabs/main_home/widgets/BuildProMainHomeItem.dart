part of 'ProMainHomeWidgetsImports.dart';

class BuildProMainHomeItem extends StatelessWidget {
  final ProMainHomeData data;
  final OrderModel model;
  const BuildProMainHomeItem({required this.data, required this.model});

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
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.primary.withOpacity(0.5)),
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
