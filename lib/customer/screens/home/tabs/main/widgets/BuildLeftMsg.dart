part of 'MainWidgetsImports.dart';

class BuildLeftMsg extends StatelessWidget {
  final MessageModel model;
  const BuildLeftMsg({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText(
                title: model.userName ?? "",
                size: 12,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
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
                      color: MyColors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Visibility(
                    visible: model.type == 0,
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
                          url: model.message ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    child: SelectableText(
                      model.message ?? '',
                      style: TextStyle(
                          fontSize: 13,
                          color: MyColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                child: MyText(
                  title: model.date ?? '',
                  size: 10,
                  color: MyColors.blackOpacity,
                ),),
            ],
          ),
          SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: CachedImage(
              url: model.userImg ?? '',
              height: 40, width: 40,
              boxShape: BoxShape.circle,
              haveRadius: false,
            ),
          ),
        ],
      ),
    );
  }
}
