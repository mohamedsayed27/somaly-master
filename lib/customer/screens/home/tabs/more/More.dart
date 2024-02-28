part of 'MoreImports.dart';

class More extends StatefulWidget {
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  final MoreData data = MoreData();

  @override
  void initState() {
    data.setIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "more")}"),
      body: Container(
        color: MyColors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GenericListView(
          type: ListViewType.normal,
          children: [
            BuildUserInfo(),
            BuildTextRow(title: "${tr(context, "settings")}"),
            BuildMoreListTile(
              opened: Languages(),
              title: "${tr(context, "lang")}",
              icon: MyFlutterApp.global,
              // child: MyText(
              //   title: lang == 'ar' ? "العربية" : "English",
              //   color: MyColors.primary,
              //   size: 12,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
            BlocBuilder<GenericBloc, GenericState>(
              bloc: data.notifyLockCubit,
              builder: (context, state) {
                return BuildMoreNotifySettings(
                  data: data,
                );
              },
            ),
            BuildTextRow(title: "${tr(context, "contactWithUs")}"),
            BuildMoreListTile(
              icon: MyFlutterApp.circle,
              title: "${tr(context, "freqQuestions")}",
              opened: FAQS(),
            ),
            BuildMoreListTile(
              icon: MyFlutterApp.information_button,
              title: "${tr(context, "aboutApp")}",
              opened: About(),
            ),
            BuildMoreListTile(
              opened: ContactUs(),
              icon: MyFlutterApp.call,
              title: "${tr(context, "contactWithUs")}",
            ),
            BuildMoreListTile(
              opened: Terms(),
              icon: MyFlutterApp.edit_square,
              title: "${tr(context, "terms")}",
            ),
            BuildMoreListTile(
              opened: Terms(),
              onTap: () => data.shareApp(),
              title: "${tr(context, "shareApp")}",
              icon: MyFlutterApp.share,
              clickable: false,
            ),
            BuildProwItem(
              click: () => GeneralRepository(context).logOut(),
              arrow: false,
              title: "${tr(context, "logout")}",
              icon: MyFlutterApp.logout,
            ),
          ],
        ),
      ),
    );
  }
}
