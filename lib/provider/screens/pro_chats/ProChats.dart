part of 'ProChatsImports.dart';

class ProChats extends StatefulWidget {
  final String receiverId;
  final int orderId;
  final String receiverName;
  final Color color;

  const ProChats(
      {required this.receiverId,
      required this.receiverName,
      required this.color,
      required this.orderId});

  @override
  _ProChatsState createState() => _ProChatsState();
}

class _ProChatsState extends State<ProChats> {
  final ProChatsData chatsData = new ProChatsData();

  // @override
  // void initState() {
  //   var user = context.read<UserCubit>().state.model;
  //   chatsData.userModel = user;
  //   String id = user.id;
  //   chatsData.pagingController.addPageRequestListener((pageKey) {
  //     chatsData.fetchData(context, widget.orderId, pageKey);
  //   });
  //   chatsData.setConnectServer(id);
  //   WidgetsBinding.instance!.addObserver(
  //     LifecycleEventHandler(
  //       detachedCallBack: () async =>
  //           chatsData.hubConnection.invoke("DisConnect", args: <Object>["$id"]),
  //       resumeCallBack: () => chatsData.setConnectServer(id),
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.receiverName,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            BuildChatMessages(
              receiverName: widget.receiverName,
              chatsData: chatsData,
              // color: widget.color,
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   String id = chatsData.userModel.id;
  //   chatsData.hubConnection.invoke("DisConnect", args: <Object>["$id"]);
  // }
}
