part of 'MoreWidgetsImports.dart';

class BuildTextRow extends StatelessWidget {
  final String title;

  const BuildTextRow({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: MyText(
        title: title,
        color: MyColors.blackOpacity,
        size: 12,
      ),
    );
  }
}
