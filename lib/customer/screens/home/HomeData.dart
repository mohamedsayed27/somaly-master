part of 'HomeImports.dart';

class HomeData {
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
