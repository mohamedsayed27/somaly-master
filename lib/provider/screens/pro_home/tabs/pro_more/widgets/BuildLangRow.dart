part of 'ProMoreWidgetsImports.dart';

class BuildLangRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.white,
      middleColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => Languages(),
      closedBuilder: (context, action) => Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  MyFlutterApp.global,
                  size: 23,
                  color: MyColors.black,
                ),
                SizedBox(width: 30),
                MyText(
                  title: tr(context,"lang"),
                  color: MyColors.black,
                  size: 12,
                ),
                Spacer(),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: MyText(
                //     title: lang == "ar" ? tr(context, "Lang") : "ُEnglish",
                //     color: MyColors.primary,
                //     size: 12,
                //   ),
                // ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
          ),
          Divider(
            color: MyColors.blackOpacity,
            height: 5,
          ),
        ],
      ),
    );
  }
}
