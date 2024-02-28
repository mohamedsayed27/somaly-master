part of 'ChatWidgetImports.dart';

class BuildChatInput extends StatelessWidget {
  final ProChatsData chatsData;
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
      padding: EdgeInsets.only(bottom: 5),
      color: color,
      child: GenericTextField(
        fieldTypes: FieldTypes.chat,
        // label: tr(context,"WriteMsgHere"),
        controller: chatsData.msgInput,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hint: tr(context, "WriteMsgHere"),
        action: TextInputAction.newline,
        validate: (String? value) => value!.noValidate(),
        type: TextInputType.text,
        // submit: () => chatsData.sendChatMessage(receiverId, orderId, context),
      ),
    );
  }
}
