part of 'WelcomeImports.dart';

class WelcomeData {
  final GenericBloc<int> welcomeCubit = GenericBloc(0);
  late PageController controller;

  void movePage(int page) {
    controller.animateToPage(page,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
