part of 'ChatsImports.dart';

class Chats extends StatefulWidget {
  final String receiverId;
  final int orderId;
  final String receiverName;
  final Color color;

  const Chats({
    required this.receiverId,
    required this.receiverName,
    required this.color,
    required this.orderId,
  });

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final ChatsData chatsData = new ChatsData();

  @override
  void initState() {
    var user = context.read<UserCubit>().state.model;
    var userType = context.read<UserCubit>().state.model.typeUser;
    chatsData.userModel = user;
    chatsData.userId = userType == 1 ? user.customerModel!.id : user.providerModel!.id;
    // chatsData.fetchData(context, widget.orderId, 1);
    chatsData.pagingController.addPageRequestListener((pageKey) {
      chatsData.fetchData(context, widget.orderId, pageKey);
    });
    chatsData.setConnectServer(chatsData.userId);
    WidgetsBinding.instance!.addObserver(
      LifecycleEventHandler(
        detachedCallBack: () async => chatsData.hubConnection.invoke("DisConnect", args: <Object>["${chatsData.userId}"]),
        resumeCallBack: () => chatsData.setConnectServer(chatsData.userId),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.receiverName,
        showBack: true,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            BuildChatMessages(
              receiverName: widget.receiverName,
              chatsData: chatsData,
              color: widget.color,
            ),
            BuildChatInput(
              chatsData: chatsData,
              receiverId: widget.receiverId,
              orderId: widget.orderId,
              color: widget.color,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    chatsData.hubConnection
        .invoke("DisConnect", args: <Object>["${chatsData.userId}"]);
  }
}
