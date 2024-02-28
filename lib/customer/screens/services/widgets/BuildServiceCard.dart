part of 'StudentServicesWidgetsImports.dart';

class BuildServiceCard extends StatelessWidget {
  final ServiceModel model;

  const BuildServiceCard({required this.model});

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
      openBuilder: (context, action) => ServiceDetails(
        subId: model.id,
        subName: model.name,
      ),
      closedBuilder: (context, action) => Column(
        children: [
          CachedImage(
            url: model.img,
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.width * .4,
            borderRadius: BorderRadius.circular(15),
          ),
          SizedBox(height: 8),
          MyText(
            title: model.name,
            color: MyColors.primary,
            size: 13,
            fontWeight: FontWeight.bold,
            alien: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
