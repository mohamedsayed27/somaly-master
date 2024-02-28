part of 'MainWidgetsImports.dart';

class BuildCloseDrawerIcon extends StatelessWidget {
  const BuildCloseDrawerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: ()=> Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.close,
              size: 20,
              color: MyColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
