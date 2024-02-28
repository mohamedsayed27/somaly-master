part of 'MainWidgetsImports.dart';

class BuildGroupChatMessages extends StatelessWidget {
  final MainPageData mainPageData;
  final Color color;

  const BuildGroupChatMessages(
      {required this.mainPageData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var type = context.watch<UserCubit>().state.model.typeUser;
    var user = context.watch<UserCubit>().state.model;
    var userId = type == 1 ? user.customerModel!.id : user.providerModel!.id;
    return Flexible(
      child: PagedListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        pagingController: mainPageData.pagingController,
        builderDelegate: PagedChildBuilderDelegate<MessageModel>(
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: MyText(
              title: tr(context, 'noMessages'),
              size: 12,
              color: MyColors.primary,
            ),
          ),
          itemBuilder: (context, item, index) {
            print("================> item ${item.toJson()}");
            if (userId == item.userId || userId == item.senderId) {
              return BuildRightMsg(
                model: item,
                user: user,
                color: color,
              );
            } else {
              return BuildLeftMsg(
                model: item,
              );
            }
          },
        ),
      ),
    );
  }
}
