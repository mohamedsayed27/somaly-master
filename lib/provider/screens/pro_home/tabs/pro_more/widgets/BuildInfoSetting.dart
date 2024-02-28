part of 'ProMoreWidgetsImports.dart';

class BuildInfoSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildProUserInfo(),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: MyText(
            title: tr(context, "profile"),
            color: MyColors.blackOpacity,
            size: 14,
          ),
        ),
        BuildProTextRowItem(
          title: tr(context, "EditProfile"),
          icon: Icons.person,
          opened: ProProfile(),
        ),
        BuildProTextRowItem(
          opened: ProServices(),
          title: tr(context, "services"),
          icon: MyFlutterApp.custom_broker,
        ),
        // BuildProTextRowItem(
        //   title: 'معلومات التواصل',
        //   icon: MyFlutterApp.call,
        //   opened: ProContactInfo(),
        // ),
        BuildProTextRowItem(
          title: tr(context, "followingList"),
          icon: MyFlutterApp.follow,
          opened: FollowingList(),
        ),
        BuildProTextRowItem(
          title: tr(context, "wallet"),
          image: Res.wallet,
          opened: Wallet(),
        ),
      ],
    );
  }
}
