part of 'LanguagesWidgetsImports.dart';

class BuildLangItem extends StatelessWidget {
  final String title, value, group, img;
  final LanguagesData languagesData;
  BuildLangItem(
      {required this.value,
      required this.title,
      required this.group,
      required this.img,
      required this.languagesData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 35, width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: MyColors.grey,
                  spreadRadius: 0.1,
                  blurRadius: 2,
                  offset: Offset(1, 2)
                ),
              ]
            ),
          ),
          title: MyText(title: title, color: MyColors.blackOpacity, size: 12),
          trailing: Radio<String>(
            value: value,
            groupValue: group,
            activeColor: MyColors.primary,
            onChanged: (value) {
              print("==================>>>> value : $value");
              languagesData.langCubit.onUpdateData(value!);
            },
          ),
        ),
        Divider(color: MyColors.blackOpacity)
      ],
    );
  }
}
