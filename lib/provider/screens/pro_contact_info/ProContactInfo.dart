part of 'ProContactInfoImports.dart';

class ProContactInfo extends StatefulWidget {
  @override
  _ProContactInfoState createState() => _ProContactInfoState();
}

class _ProContactInfoState extends State<ProContactInfo> {
  final ProContactInfoData data = ProContactInfoData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "contactInfo"),
        showBack: true,
      ),
      body: Column(
        children: [
          BuildProContactInfoInputs(data: data),
          DefaultButton(
            title: tr(context, "save"),
            onTap: () {},
            margin: const EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
