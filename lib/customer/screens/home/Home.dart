part of 'HomeImports.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeData homeData = HomeData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: homeData.onBackPressed,
      child: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              MainPage(),
              MyOrders(),
              Notifications(),
              Messages(),
              More(),
            ],
          ),
          bottomNavigationBar: BuildBottomNavigationTabBar(),
        ),
      ),
    );
  }
}
