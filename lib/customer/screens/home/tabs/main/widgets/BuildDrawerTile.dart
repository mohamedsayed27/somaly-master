part of 'MainWidgetsImports.dart';

class BuildDrawerTile extends StatelessWidget {
  final String imgURL;
  final String title;
  final Widget opened;

  const BuildDrawerTile({
    required this.imgURL,
    required this.title,
    required this.opened,
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
      openBuilder: (context, action) => opened,
      closedBuilder: (context, action) => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Image.asset(
            imgURL,
            width: 40,
            height: 40,
          ),
          title: MyText(
            title: title,
            color: MyColors.black,
            size: 12,
          ),
        ),
      ),
    );
  }
}
