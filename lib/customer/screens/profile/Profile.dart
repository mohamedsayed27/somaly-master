part of 'ProfileImports.dart';

class Profile extends StatelessWidget {
  final ProfileData profileData = ProfileData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "profile")}", showBack: true),
      body: GenericListView(
        padding: EdgeInsets.symmetric(vertical: 50),
        children: [
          BuildMoreListTile(
            opened: EditProfile(),
            title: '${tr(context, "editProfile")}',
            icon: MyFlutterApp.user,
          ),
          BuildMoreListTile(
            opened: Payment(),
            title: '${tr(context, "payment")}',
            icon: MyFlutterApp.wallet,
          ),
          BuildMoreListTile(
            opened: FollowingList(),
            title: '${tr(context, "followingList")}',
            icon: MyFlutterApp.follow,
          ),
          InkWell(
            onTap: () => profileData.removeAccount(context),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.primary),
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: "حذف الحساب",
                          color: Colors.red,
                          size: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
