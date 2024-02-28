part of 'ProMainHomeImports.dart';

class ProMainHome extends StatefulWidget {
  @override
  _ProMainHomeState createState() => _ProMainHomeState();
}

class _ProMainHomeState extends State<ProMainHome> {
  final ProMainHomeData data = ProMainHomeData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: BuildProMainHomeAppBar(data: data),
      child: Column(
        children: [
          BuildMainHomeCarousel(data: data),
          BuildProMainHomeBody(data: data),
        ],
      ),
    );
  }
}
