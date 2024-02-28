part of 'MyOrdersWidgetsImports.dart';

class BuildTabItem extends StatelessWidget {
  final String title;
  final int current;
  final int index;

  const BuildTabItem({
    required this.title,
    required this.current,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: current == index ? MyColors.primary : MyColors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: MyText(
          title: title,
          color: current == index ? MyColors.white : MyColors.black,
          size: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
