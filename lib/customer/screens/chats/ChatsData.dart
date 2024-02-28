part of 'ChatsImports.dart';

class ChatsData {
  final GlobalKey btnKey = new GlobalKey();
  final TextEditingController msgInput = new TextEditingController();
  final TextEditingController report = new TextEditingController();

  List<MessageModel> chatList = [];
 GenericBloc<List<MessageModel>> chatListBloc = GenericBloc([]);

  late HubConnection hubConnection;
  late UserModel userModel;
  late String userId;

  int count = 0;
  int pageSize = 10;

  final PagingController<int, MessageModel> pagingController =
      PagingController(firstPageKey: 1);

  fetchData(BuildContext context, int orderId, int pageNumber) async {
    var data =
        await GeneralRepository(context).getChatMessages(orderId, pageNumber);
    if (pageNumber == 1) {
      pagingController.itemList = [];
    }
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      var lst = data.reversed.toList();
      pagingController.appendLastPage(lst);
      chatList.addAll(lst);
      chatListBloc.onUpdateData(lst);
    } else {
      final nextPageKey = pageNumber + 1;
      var lst = data.reversed.toList();
      pagingController.appendPage(lst, nextPageKey);
      chatList.addAll(lst);
      chatListBloc.onUpdateData(lst);
    }
  }

  void setConnectServer(String userId) async {
    hubConnection = HubConnectionBuilder()
        .withUrl("https://wasetalsumaili.ip4s.com/chatHub")
        .build();
    await hubConnection.start();
    hubConnection.onclose((error) => print("error when connect => $error"));
    hubConnection.on("receiveMessage", _handleIncomingChatMessage);
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

  void setGetImage(String receiverID, BuildContext context, int orderId) async {
    var file = await Utils.getImage();
    if (file != null) {
      print("=====================111111> $file");
      uploadFile(receiverID, context, file, 1, orderId);
    }
  }

  void uploadFile(String receiverID, BuildContext context, File file, int type,
      int orderId) async {
    print("=====================22222222> $file");
    var data = await CustomerRepository(context).uploadFile(file);
    if (data.isNotEmpty) {
      sendChatMessage(receiverID, orderId, context, type: type, path: data);
    }
  }

  void sendChatMessage(String receiverID, int orderId, BuildContext context,
      {int type = 0, String path = ""}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (msgInput.text.trim().isEmpty && path.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    MessageModel msg = MessageModel(
      id: chatListBloc.state.data.length,
      date: DateFormat("hh:mm a").format(DateTime.now()),
      message: path.isEmpty ? msgInput.text : path,
      receiverId: receiverID,
      senderId: userId,
      type: type,
      orderId: orderId,
    );
    List<Object> _args = [
      "${msg.senderId}",
      "$receiverID",
      path.isEmpty ? msgInput.text : path,
      orderId.toString(),
      type,
      0
    ];
    _args.forEach((element) {
      print(element);
    });
    _updateAndMoveDown(msg);
    msgInput.text = "";
    await hubConnection.invoke("sendMessage", args: _args);
  }
}
