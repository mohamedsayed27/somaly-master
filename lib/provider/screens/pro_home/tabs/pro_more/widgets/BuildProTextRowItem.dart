part of 'ProMoreWidgetsImports.dart';

class BuildProTextRowItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? child;
  final Widget opened;
  final bool? arrow;
  final String? image;

  const BuildProTextRowItem(
      { this.icon,
      required this.title,
      this.child,
      this.arrow = true,
      this.image,
      required this.opened});

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
      closedBuilder: (context, action) => Column(
        children: [
          ListTile(
            leading: image != null
                ? ImageIcon(
                    AssetImage(image ?? ''),
                    size: 27,
                    color: MyColors.black,
                  )
                : Icon(
                    icon,
                    size: 23,
                    color: MyColors.black,
                  ),
            title: MyText(
              title: title,
              color: MyColors.black,
              size: 12,
            ),
            trailing: Visibility(
              visible: arrow == true,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: MyColors.black,
              ),
            ),
          ),
          Divider(
            color: MyColors.blackOpacity,
            height: 5,
          ),
        ],
      ),
    );
  }
}
