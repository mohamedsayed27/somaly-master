part of 'SelectLangWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final SelectLangData selectLangData;

  const BuildButtonList({required this.selectLangData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: 'العربية',
          onTap: () => selectLangData.setUserLang(context, "ar"),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: MyColors.primary,
          textColor: MyColors.white,
        ),
        DefaultButton(
          title: 'English',
          onTap: () => selectLangData.setUserLang(context, "en"),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
        DefaultButton(
          title: "বাংলা",
          onTap: () => selectLangData.setUserLang(context, "bn"),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
        DefaultButton(
          title: "हिन्दी",
          onTap: () => selectLangData.setUserLang(context, "hi"),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
        DefaultButton(
          title: "اردو",
          onTap: () => selectLangData.setUserLang(context, "ur"),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
      ],
    );
  }
}
