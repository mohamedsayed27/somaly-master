part of 'MessagesImports.dart';

class MessagesData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController search = TextEditingController();
  final GenericBloc<List<AllChatsModel>> allChatCubit = new GenericBloc([]);

  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await GeneralRepository(context).getAllChats(refresh);
    allChatCubit.onUpdateData(data);
  }

  navigateToChat(BuildContext context, AllChatsModel model) async {
    await AutoRouter.of(context).push(ChatsRoute(
      receiverId: model.userId,
      receiverName: model.userName,
      orderId: model.orderNumber,
      color: MyColors.primary,
    ));
    fetchData(context);
  }

  void searchData(String text, BuildContext context) {
    if(text != ''){
      var filtered = allChatCubit.state.data
          .where((element) =>
          element.userName.toLowerCase().contains(text.toLowerCase()))
          .toList();
      allChatCubit.onUpdateData(filtered);
    } else {
      fetchData(context);
    }
  }

}
