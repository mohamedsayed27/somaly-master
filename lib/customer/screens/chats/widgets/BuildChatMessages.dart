part of 'ChatWidgetImports.dart';

class BuildChatMessages extends StatelessWidget {
  final ChatsData chatsData;
  final String receiverName;
  final Color color;

  const BuildChatMessages(
      {required this.chatsData,
      required this.receiverName,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var type = context.watch<UserCubit>().state.model.typeUser;
    var user = context.watch<UserCubit>().state.model;
    var userId = type == 1 ? user.customerModel!.id : user.providerModel!.id;
    return BlocBuilder<GenericBloc<List<MessageModel>>, GenericState<List<MessageModel>>>(
      bloc: chatsData.chatListBloc,
  builder: (context, state) {
    return Flexible(
      child: PagedListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        pagingController: chatsData.pagingController,
        builderDelegate: PagedChildBuilderDelegate<MessageModel>(
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: MyText(
              title: tr(context, 'noMessages'),
              size: 12,
              color: MyColors.primary,
            ),
          ),
          itemBuilder: (context, item, index) {
            if (userId == item.senderId) {
              return BuildRightMsg(
                model: item,
                user: user,
                color: color,
              );
            } else {
              return BuildLeftMsg(
                model: item,
                receiverName: receiverName,
              );
            }
          },
        ),
      ),
    );
  },
);
  }
}
