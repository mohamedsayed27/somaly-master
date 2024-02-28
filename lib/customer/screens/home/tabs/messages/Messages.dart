part of 'MessagesImports.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final MessagesData data = MessagesData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'chat'),
      ),
      child: Column(
        children: [
          BuildSearch(data: data),
          Flexible(
            child: GenericListView<AllChatsModel>(
                type: ListViewType.separated,
                padding: EdgeInsets.only(top: 20),
                onRefresh: data.fetchData,
                emptyStr: "${tr(context, "noChat")}",
                cubit: data.allChatCubit,
                refreshBg: MyColors.primary,
                params: [context],
                itemBuilder: (context, index, item) {
                  return BuildMessagesItem(
                    model: item,
                    messagesData: data,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
