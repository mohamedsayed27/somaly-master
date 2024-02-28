part of 'MoreWidgetsImports.dart';

class BuildMoreListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double? iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final bool? showTrailing;
  final Function()? onTap;
  final Widget opened;
  final bool? clickable;

  const BuildMoreListTile(
      {required this.icon,
      required this.title,
      this.iconSize,
      this.fontSize,
      this.fontWeight,
      this.child,
      this.showTrailing,
      this.onTap,
      required this.opened,
      this.clickable,
      });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.white,
      middleColor: Colors.transparent,
      tappable: clickable ?? true,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => opened,
      closedBuilder: (context, action) => Container(
        color: MyColors.offWhite.withOpacity(.3),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      size: iconSize ?? 20,
                      color: MyColors.black,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: title,
                            color: MyColors.black,
                            size: fontSize ?? 11,
                            fontWeight: fontWeight ?? FontWeight.bold,
                          ),
                          child ?? Container(),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Visibility(
                      visible: showTrailing ?? true,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1, height: 0),
          ],
        ),
      ),
    );
  }
}
