part of 'SelectLangImports.dart';

class SelectLangData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  void setUserLang(BuildContext context, String lang,) async {
    Utils.changeLanguage(lang, context);
    // AutoRouter.of(context).push(SelectUserRoute());
    AutoRouter.of(context).push(SelectUserRoute());

    // ExtendedNavigator.of(context).push(Routes.login);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
