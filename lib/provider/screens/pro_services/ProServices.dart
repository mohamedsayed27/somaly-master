part of 'ProServicesImports.dart';

class ProServices extends StatefulWidget {
  @override
  _ProServicesState createState() => _ProServicesState();
}

class _ProServicesState extends State<ProServices> {
  final ProServicesData data = ProServicesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "OurServices"),
        showBack: true,
      ),
      body: BuildProServicesBody(data: data),
    );
  }
}
