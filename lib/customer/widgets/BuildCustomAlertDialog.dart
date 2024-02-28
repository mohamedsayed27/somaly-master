part of 'CustomerWidgetsImports.dart';

class BuildCustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String buttonTitle;
  final Widget content;
  final Function() sendButton;

  BuildCustomAlertDialog({
    this.title = '',
    required this.buttonTitle,
    required this.content,
    this.bgColor = Colors.white,
    required this.sendButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      title: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
                SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    color: MyColors.blackOpacity,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => AutoRouter.of(context).pop(),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.white,
                ),
                child: Icon(
                  Icons.clear,
                  size: 25,
                  color: MyColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      content: content,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: <Widget>[
        DefaultButton(
          title: buttonTitle,
          onTap: sendButton,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(5),
          color: MyColors.primary,
        ),
      ],
    );
  }
}
