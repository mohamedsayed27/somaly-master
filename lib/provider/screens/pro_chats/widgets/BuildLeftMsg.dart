part of 'ChatWidgetImports.dart';

class BuildLeftMsg extends StatelessWidget {
  // final MessageModel model;
  final String receiverName;

  const BuildLeftMsg({required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Offstage(
          //   offstage: context.watch<UserCubit>().state.model.typeUser==1,
          //   child: MyText(title: receiverName,size: 8,color: MyColors.blackOpacity,),
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
                color: MyColors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: MyText(
                // title: model.message??"",
                title: "ازيك عامل ايه ؟",
                size: 9,
                color: MyColors.black,
              ),
            ),
          ),
          MyText(
            title: "3.00 pm",
            // title: model.date??"",
            size: 8,
            color: MyColors.blackOpacity,
          ),
        ],
      ),
    );
  }
}
