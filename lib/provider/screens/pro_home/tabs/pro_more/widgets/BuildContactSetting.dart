part of 'ProMoreWidgetsImports.dart';

class BuildContactSetting extends StatelessWidget {
  final ProMoreData proMoreData;

  const BuildContactSetting({Key? key, required this.proMoreData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var type = context.watch<UserCubit>().state.model.typeUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MyText(
            title: tr(context, "contactUs"),
            color: MyColors.blackOpacity,
            size: 14,
          ),
        ),
        BuildProTextRowItem(
          title: tr(context, "commonQuestions"),
          icon: MyFlutterApp.circle,
          opened: FAQS(),
        ),
        BuildProTextRowItem(
          title: tr(context, "about"),
          icon: MyFlutterApp.information_button,
          opened: About(),
        ),
        BuildProTextRowItem(
          title: tr(context, 'terms'),
          icon: MyFlutterApp.information_button,
          opened: Terms(),
        ),
        BuildProTextRowItem(
          title: tr(context, "contactUs"),
          icon: MyFlutterApp.call,
          opened: ContactUs(),
        ),
        BuildProwItem(
          click: () => proMoreData.shareApp(),
          arrow: true,
          title: tr(context, "shareApp"),
          icon: MyFlutterApp.share,
        ),
        BuildProwItem(
          click: () => GeneralRepository(context).logOut(),
          arrow: false,
          title: tr(context, "logout"),
          icon: MyFlutterApp.logout,
        ),
      ],
    );
  }
}
