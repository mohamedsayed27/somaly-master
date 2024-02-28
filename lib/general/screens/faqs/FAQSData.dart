part of 'FAQSImports.dart';

class FAQSData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericBloc<List<QuestionModel>> questionsCubit = new GenericBloc([]);

  void fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await GeneralRepository(context).frequentQuestions();
    questionsCubit.onUpdateData(data);
  }

  changeItemState(int index) {
    questionsCubit.state.data[index].closed =
        !questionsCubit.state.data[index].closed;
    questionsCubit.onUpdateData(questionsCubit.state.data);
  }
}
