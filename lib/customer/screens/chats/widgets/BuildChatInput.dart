part of 'ChatWidgetImports.dart';

class BuildChatInput extends StatelessWidget {
  final ChatsData chatsData;
  final String receiverId;
  final int orderId;
  final Color color;


  const BuildChatInput(
      {required this.chatsData,
      required this.receiverId,
      required this.color,
      required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColors.primary,
        padding: EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: GenericTextField(
                controller: chatsData.msgInput,
                action: TextInputAction.newline,
                fieldTypes: FieldTypes.chat,
                type: TextInputType.multiline,
                fillColor: MyColors.white,
                enableBorderColor: MyColors.white,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                hint: '${tr(context, "WriteMsgHere")}',
                validate: (value) => value!.noValidate(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () => chatsData.setGetImage(
                      receiverId, context, orderId),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  size: 30,
                  color: MyColors.white,
                ),
                onPressed: () => chatsData.sendChatMessage(receiverId, orderId, context),
              ),
            ),
          ],
        )
    );
  }
}
