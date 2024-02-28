part of 'HomeWidgetsImports.dart';

class BuildBottomNavigationTabBar extends StatelessWidget {
  const BuildBottomNavigationTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      labelColor: MyColors.primary,
      labelStyle: GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelColor: MyColors.grey,
      unselectedLabelStyle: GoogleFonts.cairo(fontSize: 11),
      indicatorColor: MyColors.offWhite,
      tabs: [
        BuildTabItem(title: "${tr(context, "home")}", icon: MyFlutterApp.home_fill),
        BuildTabItem(title: "${tr(context, "orders")}", icon: MyFlutterApp.order_fill),
        BuildTabItem(title: "${tr(context, "notifications")}", icon: MyFlutterApp.notification_fill),
        BuildTabItem(title: "${tr(context, "messages")}", icon: MyFlutterApp.chat_fill),
        BuildTabItem(title: "${tr(context, "more")}", icon: MyFlutterApp.more_fill),
      ],
    );
  }
}
