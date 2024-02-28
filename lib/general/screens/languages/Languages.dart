part of 'LanguagesImports.dart';

class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  final LanguagesData languagesData = new LanguagesData();

  @override
  initState() {
    languagesData.setLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg2,
      appBar: DefaultAppBar(
        title: tr(context, "lang"),
        showBack: true,
      ),
      body: Column(
        children: [
          Flexible(child: BuildLanguagesView(languagesData: languagesData)),
          LoadingButton(
            title: tr(context, "saveChanges"),
            onTap: () => languagesData.setLanguage(context),
            margin: const EdgeInsets.all(20),
            btnKey: languagesData.btnKey,
          ),
        ],
      ),
    );
  }
}
