part of 'FollowingListWidgetsImports.dart';

class BuildFollowingListBody extends StatefulWidget {
  final ProFollowingListData data;
  const BuildFollowingListBody({required this.data});

  @override
  State<BuildFollowingListBody> createState() => _BuildFollowingListBodyState();
}

class _BuildFollowingListBodyState extends State<BuildFollowingListBody> {
  @override
  Widget build(BuildContext context) {
    return GenericListView<FollowerModel>(
      padding: EdgeInsets.symmetric(horizontal: 15),
      type: ListViewType.api,
      cubit: widget.data.followerCubit,
      onRefresh: widget.data.fetchData,
      params: [context],emptyStr: tr(context, 'noData'),
      itemBuilder: (_, index, item) {
        return BuildFollowingListItem(
          data: widget.data,
          model: item,
        );
      },
    );
  }
}
