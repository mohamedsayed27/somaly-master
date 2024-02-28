part of 'LanguagesWidgetsImports.dart';

class BuildLanguagesView extends StatelessWidget {
  final LanguagesData languagesData;

  const BuildLanguagesView({required this.languagesData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<String>, GenericState<String>>(
      bloc: languagesData.langCubit,
      builder: (_, state) {
        return GenericListView(
          type: ListViewType.normal,
          padding: const EdgeInsets.all(15),
          children: [
            BuildLangItem(
              title: "العربية",
              img: Res.saudi,
              value: "ar",
              group: state.data,
              languagesData: languagesData,
            ),
            BuildLangItem(
              title: "English",
              img: Res.english,
              value: "en",
              group: state.data,
              languagesData: languagesData,
            ),
            BuildLangItem(
              title: "বাংলা",
              img: Res.benghal,
              value: "bn",
              group: state.data,
              languagesData: languagesData,
            ),
            BuildLangItem(
              title: "हिन्दी",
              img: Res.india,
              value: "hi",
              group: state.data,
              languagesData: languagesData,
            ),
            BuildLangItem(
              title: "اردو",
              img: Res.urdu,
              value: "ur",
              group: state.data,
              languagesData: languagesData,
            ),
          ],
        );
      },
    );
  }
}
