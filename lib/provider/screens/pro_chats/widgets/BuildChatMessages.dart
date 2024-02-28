part of 'ChatWidgetImports.dart';

class BuildChatMessages extends StatelessWidget {
  final ProChatsData chatsData;
  final String receiverName;

  const BuildChatMessages(
      {required this.chatsData, required this.receiverName});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    //String id = user.id;
    // String id = user.type=="user"?user.customerModel!.id
    //     :user.providerModel!.id;
    return Container();
    //   Flexible(
    //   child: PagedListView(
    //     reverse: true,
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     // pagingController: chatsData.pagingController,
    //     builderDelegate: PagedChildBuilderDelegate<MessageModel>(
    //       noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(
    //         title: tr(context, "noMessages"),
    //         message: tr(context, "sendFirstMsg"),
    //       ),
    //       itemBuilder: (context, item, index) {
    //         if (id == item.senderId) {
    //           return BuildRightMsg(
    //             user: user,
    //             color: MyColors.grey,
    //           );
    //         } else {
    //           return BuildLeftMsg(
    //             receiverName: 'seif',
    //           );
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}
