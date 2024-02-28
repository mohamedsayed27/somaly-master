part of 'FollowingListWidgetsImports.dart';

class BuildFollowingListItem extends StatelessWidget {
  final ProFollowingListData data;
  final FollowerModel model;
  const BuildFollowingListItem({required this.data, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.grey.withOpacity(.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedImage(
            url: model.img??"",
            haveRadius: true,
            borderRadius: BorderRadius.circular(15),
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: model.name??"",
                color: MyColors.primary,
                size: 12,
              ),
              Row(
                children: [
                  Icon(
                    MyFlutterApp.location,
                    size: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: MyText(
                      title: model.location??"",
                      color: MyColors.blackOpacity,
                      size: 11,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          InkWell(
              onTap: () => data.deleteFollower(context, model.userId??""),
              child: MyText(title: tr(context,"remove"), color: MyColors.primary, size: 12)),
        ],
      ),
    );
  }
}
