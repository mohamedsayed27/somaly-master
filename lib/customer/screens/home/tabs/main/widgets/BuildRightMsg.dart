part of 'MainWidgetsImports.dart';

class BuildRightMsg extends StatelessWidget {
  final MessageModel model;
  final UserModel user;
  final Color color;

  const BuildRightMsg({required this.model, required this.user,required this.color});

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
                color: MyColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: Visibility(
                visible: model.type == 0,
                child: SelectableText(
                  model.message ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    color: MyColors.white,
                  ),
                ),
                replacement:InkWell(
                  onTap: () => AutoRouter.of(context).push(
                    ImageZoomRoute(images: [model.message],),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      minHeight: 30,
                      maxWidth: MediaQuery.of(context).size.width * .7,
                      minWidth: MediaQuery.of(context).size.width * .4,
                    ),
                    child: CachedImage(
                      url: model.message ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
            ),
          ),
          MyText(
            title: model.date ?? "",
            size: 10,
            color: MyColors.blackOpacity.withOpacity(.6),
          ),
        ],
      ),
    );
  }
}
