part of 'FAQSImports.dart';

class FAQS extends StatefulWidget {
  @override
  _FAQSState createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  final FAQSData fAQSData = new FAQSData();

  @override
  void initState() {
    fAQSData.fetchData(context, refresh: false);
    fAQSData.fetchData(
      context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: '${tr(context, "freqQuestions")}',
        showBack: true,
      ),
      body: BlocBuilder<GenericBloc<List<QuestionModel>>,
          GenericState<List<QuestionModel>>>(
        bloc: fAQSData.questionsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return BuildQuestionsList(
              questions: state.data,
              faqsData: fAQSData,
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
