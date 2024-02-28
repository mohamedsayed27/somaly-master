part of 'ChatWidgetImports.dart';

class BuildLeftMsg extends StatelessWidget {
  final MessageModel model;
  final String receiverName;

  const BuildLeftMsg({required this.model, required this.receiverName});

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
          InkWell(
            onTap: () {},
            child: MyText(
              title: receiverName,
              size: 12,
              color: MyColors.blackOpacity,
            ),
          ),
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
                  color: MyColors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: Visibility(
                visible: model.type == 0,
                child: SelectableText(
                  model.message ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    color: MyColors.white,
                  ),
                ),
                replacement: InkWell(
                  onTap: () => AutoRouter.of(context).push(
                    ImageZoomRoute(
                      images: [model.message],
                    ),
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
