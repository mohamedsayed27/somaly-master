part of 'ConversationsImports.dart';

class Conversations extends StatefulWidget {
  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final ConversationsData data = ConversationsData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'chat'),
      ),
      child: Column(
        children: [
          BuildProSearch(data: data),
          Flexible(
            child: GenericListView<AllChatsModel>(
                type: ListViewType.separated,
                padding: EdgeInsets.only(top: 20),
                onRefresh: data.fetchData,
                emptyStr: tr(context, "noChats"),
                cubit: data.allChatCubit,
                refreshBg: MyColors.primary,
                params: [context],
                itemBuilder: (context, index, item) {
                  return BuildConversationItem(
                    model: item,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
