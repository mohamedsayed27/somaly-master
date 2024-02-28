part of 'ProHomeWidgetsImports.dart';

class BuildProBottomNavigationTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        labelColor: MyColors.primary,
        labelStyle:
            GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelColor: MyColors.grey,
        unselectedLabelStyle: GoogleFonts.cairo(fontSize: 12),
        indicatorColor: MyColors.offWhite,
        tabs: [
          BuildTabItem(title: tr(context, "main"), icon: MyFlutterApp.home_empty),
          BuildTabItem(title: tr(context, "myOrders"), icon: MyFlutterApp.order_empty),
          BuildTabItem(
              title: tr(context, "notifications"), icon: MyFlutterApp.notification_empty),
          BuildTabItem(title: tr(context, "messages"), icon: MyFlutterApp.chat_empty),
          BuildTabItem(title: tr(context,"more"), icon: MyFlutterApp.more_empty),
        ],
      ),
    );
  }
}
