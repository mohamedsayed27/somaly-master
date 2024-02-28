part of 'HomeWidgetsImports.dart';

class BuildTabItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const BuildTabItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      icon: Icon(icon),
    );
  }
}
