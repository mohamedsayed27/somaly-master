part of 'ProFollowingListImports.dart';

class FollowingList extends StatefulWidget {
  @override
  _FollowingListState createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final ProFollowingListData data = ProFollowingListData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: '${tr(context, "followingList")}',
        showBack: true,
      ),
      body: BuildFollowingListBody(data: data),
    );
  }
}
