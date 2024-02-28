part of 'ProMoreWidgetsImports.dart';

class BuildProwItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback click;
  final Widget? child;
  final bool? arrow;

  const BuildProwItem(
      {required this.icon,
      required this.title,
      this.arrow,
      this.child,
      required this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              size: 23,
              color: MyColors.black,
            ),
            title: MyText(
              title: title,
              color: MyColors.black,
              size: 12,
              fontWeight: FontWeight.bold,
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
