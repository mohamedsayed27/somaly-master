part of 'ChatWidgetImports.dart';

class BuildRightMsg extends StatelessWidget {
  // final MessageModel model;
  final UserModel user;
  final Color color;

  const BuildRightMsg({required this.user, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Offstage(
          //   offstage: context.watch<UserCubit>().state.model.typeUser == 1,
          //   child: MyText(
          //     title: user.userName,
          //     size: 8,
          //     color: MyColors.blackOpacity,
          //   ),
          // ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 30,
              maxWidth: MediaQuery.of(context).size.width * .7,
              minWidth: MediaQuery.of(context).size.width * .4,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                color: MyColors.primary.withOpacity(.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: MyText(
                title: "الحمدلله كويس",
                // title: model.message??"",
                size: 9,
                color: MyColors.black,
              ),
            ),
          ),
          MyText(
            title: "3.00",
            // title: model.date??"",
            size: 8,
            color: MyColors.blackOpacity,
          ),
        ],
      ),
    );
  }
}
