part of 'ProOrderDetailsWidgetsImports.dart';

class BuildProOrderDetailsUserCard extends StatelessWidget {
  final OrderDetailsModel model;

  const BuildProOrderDetailsUserCard({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(5),
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
                url: model.userImg,
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
                        title: model.userName,
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
                              title: model.userLocation,
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
    );
  }
}
