part of 'MainPageImports.dart';

class MainPageData{

  final GenericBloc<List<ServiceModel>> mainServiceCubit = GenericBloc([]);

  getMainServices(BuildContext context) async {
    final data = await CustomerRepository(context).getMainServices();
    mainServiceCubit.onUpdateData(data);
  }

  final GlobalKey btnKey = GlobalKey();
  final TextEditingController msgInput = TextEditingController();
  final TextEditingController report = TextEditingController();

  List<MessageModel> chatList = [];

  late HubConnection hubConnection;
  late UserModel userModel;
  late String userId;

  int count = 0;
  int pageSize = 10;

  final PagingController<int, MessageModel> pagingController = PagingController(firstPageKey: 1);

  fetchHomeData(BuildContext context,int pageNumber,) async {
    var data = await CustomerRepository(context).getHomeMsg(pageNumber);
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      var lst = data;
      pagingController.appendLastPage(lst);
      chatList.addAll(lst);
    } else {
      final nextPageKey = pageNumber + 1;
      var lst = data;
      pagingController.appendPage(lst, nextPageKey);
      chatList.addAll(lst);
    }
  }

  void setConnectServer(String userId) async {
    hubConnection = HubConnectionBuilder()
        .withUrl("https://wasetalsumaili.ip4s.com/chatHub")
        .build();
    await hubConnection.start();
    hubConnection.onclose((error) => print("error when connect => $error"));
    hubConnection.on("receiveHomeMessage", _handleIncomingChatMessage);
    hubConnection.on("connect", _handleConnectedUsers);
    hubConnection.on("disConnect", _handleDisConnectedUsers);
    connectToServer(userId);
  }

  void connectToServer(String userId) async {
    List<Object> _args = ["$userId"];
    print("_____________$userId");
    await hubConnection.invoke("Connect", args: _args);
  }

  void _handleConnectedUsers(List<dynamic>? args) {
    print(args![0]);
  }

  void _handleDisConnectedUsers(List<dynamic>? args) {
    print(args![0]);
  }

  void _handleIncomingChatMessage(List<dynamic>? args) {
    print(args);
    MessageModel msg = MessageModel.fromJson(args![0]);
    _updateAndMoveDown(msg);
  }

  void _updateAndMoveDown(MessageModel msg) {
    chatList.insert(0, msg);
    pagingController.itemList = [];
    pagingController.itemList = chatList;
  }

  void setGetImage( BuildContext context) async {
    var file = await Utils.getImage();
    if (file != null) {
      print("=====================111111> $file");
      uploadFile(context, file, 1);
    }
  }

  void uploadFile( BuildContext context, File file, int type) async {
    print("=====================22222222> $file");
    LoadingDialog.showLoadingDialog();
    var data = await CustomerRepository(context).uploadFile(file);
    print("=====================22222222> paaaaaaaaaaaaathhhhhhh  ${data}");
    if (data.isNotEmpty) {
      sendGroupChatMessage(context, type: type, path: data);
    }
    EasyLoading.dismiss();
  }

  void sendGroupChatMessage( BuildContext context, {int type = 0, String path = ""}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (msgInput.text.trim().isEmpty && path.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    MessageModel msg = MessageModel(
      id: chatList.length,
      date: DateFormat("hh:mm a").format(DateTime.now()),
      message: path.isEmpty ? msgInput.text : path,
      receiverId: "",
      senderId: userId,
      type: type,
      orderId: 0,
    );
    print("======== ======= ================ >> paaaaaaathhhh $path");
    List<Object> _args = [
      "${msg.senderId}",
      path.isEmpty ? msgInput.text : path,
      type,
      0
    ];
    _args.forEach((element) {
      print(element);
    });
    _updateAndMoveDown(msg);
    msgInput.text = "";
    await hubConnection.invoke("sendHomeMessage", args: _args);
  }

}
