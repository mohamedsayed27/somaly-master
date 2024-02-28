part of 'MessagesWidgetsImports.dart';

class BuildMessagesItem extends StatelessWidget {
  final AllChatsModel model;
  final MessagesData messagesData;
  const BuildMessagesItem({required this.model,required this.messagesData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => messagesData.navigateToChat(context, model),
      // onTap: () {
      //   AutoRouter.of(context).push(
      //     ChatsRoute(
      //       color: MyColors.primary,
      //       receiverId: model.userId??"",
      //       receiverName: model.userName??"",
      //       orderId: model.orderNumber!,
      //     ),
      //   );
      // },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.greyWhite, width: 1),
        ),
        child: Row(
          children: [
            CachedImage(
              url: model.userImg,
              width: 60,
              height: 60,
              haveRadius: false,
              boxShape: BoxShape.circle,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          title: model.userName,
                          size: 10,
                          color: MyColors.primary,
                        ),
                        Spacer(),
                        Icon(
                          Icons.watch_later_outlined,
                          size: 13,
                          color: MyColors.primary,
                        ),
                        SizedBox(width: 5),
                        MyText(
                          title: model.date,
                          // title: "3:00 pm",
                          size: 10,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                    MyText(
                      overflow: TextOverflow.ellipsis,
                      title: model.lastMsg,
                      size: 10,
                      color: MyColors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
