part of 'FAQSWidgetsImports.dart';

class BuildQuestionsList extends StatelessWidget {
  final List<QuestionModel> questions;
  final FAQSData faqsData;
  const BuildQuestionsList({
    Key? key,
    required this.questions,
    required this.faqsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) =>
          QuestionsViewItem(
              model: questions[index],
              onTap:()=>faqsData.changeItemState(index),

          ),);
  }
}
