part of 'WelcomeImports.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final WelcomeData data = WelcomeData();
  void initState() {
    super.initState();
    data.controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: PageView(
        controller: data.controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: data.welcomeCubit.onUpdateData,
        children: [
          FirstPage(
            data: data,
            movePage: data.movePage,
          ),
          SecondPage(
            data: data,
            movePage: data.movePage,
          ),
          ThirdPage(
            data: data,
            movePage: data.movePage,
          ),
        ],
      ),
    );
  }
}
