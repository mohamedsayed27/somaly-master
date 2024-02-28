part of 'ServiceDetailsWidgetsImports.dart';

class BuildProviderCard extends StatelessWidget {
  final Widget opened;
  final ProviderDetailsModel model;

  final int subId;
  final ServiceDetailsData serviceDetailsData;

  const BuildProviderCard({
    required this.opened,
    required this.serviceDetailsData,
    required this.subId,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedColor: Colors.transparent,
        openColor: Colors.white,
        middleColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 800),
        onClosed: (v) => serviceDetailsData.fetchData(context, subId),
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (context, action) => opened,
        closedBuilder: (context, action) => Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(8),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedImage(
                    url: model.img,
                    fit: BoxFit.fill,
                    height: 70,
                    width: 70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                title: model.userName,
                                color: MyColors.primary,
                                size: 12,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: model.rate,
                              itemCount: 5,
                              itemSize: 12,
                              textDirection: lang == 'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              direction: Axis.horizontal,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: MyColors.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              MyFlutterApp.location,
                              size: 12,
                              color: MyColors.blackOpacity,
                            ),
                            SizedBox(width: 3),
                            Expanded(
                              child: MyText(
                                title: model.location,
                                color: MyColors.blackOpacity,
                                size: 11,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // BuildFollowButton(),
                ],
              ),
            ));
  }
}
