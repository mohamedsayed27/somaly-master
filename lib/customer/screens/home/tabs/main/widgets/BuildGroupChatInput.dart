part of 'MainWidgetsImports.dart';


class BuildGroupChatInput extends StatelessWidget {
  final MainPageData mainPageData;
  final Color color;


  const BuildGroupChatInput(
      {required this.mainPageData,
      required this.color,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColors.primary,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: GenericTextField(
                controller: mainPageData.msgInput,
                action: TextInputAction.newline,
                fieldTypes: FieldTypes.chat,
                type: TextInputType.multiline,
                fillColor: MyColors.white,
                enableBorderColor: MyColors.white,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                hint: '${tr(context, "WriteMsgHere")}',
                validate: (value) => value!.noValidate(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () => mainPageData.setGetImage(context),
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
                onPressed:() =>mainPageData.sendGroupChatMessage(context),
              ),
            ),
          ],
        )
    );
  }
}
