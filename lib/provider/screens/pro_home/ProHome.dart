part of 'ProHomeImports.dart';

class ProHome extends StatefulWidget {
  final int index;

  const ProHome({Key? key, this.index = 0}) : super(key: key);

  @override
  _ProHomeState createState() => _ProHomeState();
}

class _ProHomeState extends State<ProHome> {
  final ProHomeData data = ProHomeData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: data.onBack,
      child: DefaultTabController(
        length: 5,
        initialIndex: widget.index,
        child: Scaffold(
          body: TabBarView(
            children: [
              ProMainHome(),
              ProOrders(),
              ProNotifications(),
              Conversations(),
              ProMore(),
            ],
          ),
          bottomNavigationBar: BuildProBottomNavigationTabBar(),
        ),
      ),
    );
  }
}
