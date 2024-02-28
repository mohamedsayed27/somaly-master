part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageData mainPageData = MainPageData();

  @override
  void initState() {
    var user = context.read<UserCubit>().state.model;
    mainPageData.userModel = user;
    mainPageData.userId =
        user.typeUser == 1 ? user.customerModel!.id : user.providerModel!.id;
    mainPageData.pagingController.addPageRequestListener((pageKey) {
      mainPageData.fetchHomeData(context, pageKey);
    });
    mainPageData.setConnectServer(mainPageData.userId);
    mainPageData.getMainServices(context);
    WidgetsBinding.instance!.addObserver(
      LifecycleEventHandler(
        detachedCallBack: () async => mainPageData.hubConnection
            .invoke("DisConnect", args: <Object>["${mainPageData.userId}"]),
        resumeCallBack: () =>
            mainPageData.setConnectServer(mainPageData.userId),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var type = context.read<UserCubit>().state.model.typeUser;
    return Scaffold(
      appBar: BuildMainAppBar(),
      drawer:
          type == 1 ? BuildMainDrawer(mainPageData: mainPageData) :
          null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            BuildGroupChatMessages(
              mainPageData: mainPageData,
              color: MyColors.primary,
            ),
            BuildGroupChatInput(
              mainPageData: mainPageData,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mainPageData.hubConnection
        .invoke("DisConnect", args: <Object>["${mainPageData.userId}"]);
  }
}
