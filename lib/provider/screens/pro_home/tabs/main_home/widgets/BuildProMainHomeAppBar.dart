part of 'ProMainHomeWidgetsImports.dart';

class BuildProMainHomeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ProMainHomeData data;
  const BuildProMainHomeAppBar({required this.data});
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: MyColors.primary,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 7, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            MyText(
              title: tr(context, 'home'),
              color: MyColors.white,
              size: 20,
            ),
            IconButton(
              // onPressed: (){},
              onPressed: () => AutoRouter.of(context).push(MainPageRoute()),
              icon: Icon(
                MyFlutterApp.chatbubbles,
                color: MyColors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
