part of 'FirstPageImports.dart';

class FirstPage extends StatelessWidget {
  final WelcomeData data;
  final Function(int page) movePage;
  const FirstPage({required this.movePage, required this.data});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => AutoRouter.of(context).push(SelectLangRoute()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyText(
                    title: tr(context, "skip"),
                    color: MyColors.black,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(
              Res.delivery_amico,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 30),
            child: MyText(
              title:
                  '${tr(context, "firstPageTxt")}',
              //welcomeData.state.model.appScreen1,
              alien: TextAlign.center,
              size: 12,
              color: MyColors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyIndicatorDots(
                pagesCubit: data.welcomeCubit,
                dots: 3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              InkWell(
                onTap: () {
                  movePage(1);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Container(
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.primary,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: MyColors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
