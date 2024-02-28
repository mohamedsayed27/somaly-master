part of'FAQSWidgetsImports.dart';


class QuestionsViewItem extends StatelessWidget {

  final Function() onTap;
  final QuestionModel model;

  const QuestionsViewItem({Key? key,required this.onTap,required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: MyColors.white,
                border: Border.all(
                  color: MyColors.grey.withOpacity(.3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: model.question,
                    size: 10,
                    color: MyColors.blackOpacity,
                  ),
                  Icon(
                    model.closed
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: MyColors.black,
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            // index:0,
            duration:Duration(milliseconds: 500),
            // scale: true,
            child: Offstage(
              offstage: model.closed,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: MyText(
                  title: model.answer,
                  color: MyColors.blackOpacity,
                  size: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


