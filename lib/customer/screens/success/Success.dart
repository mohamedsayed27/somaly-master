part of 'SuccessImports.dart';

class Success extends StatefulWidget {
  final String mainTitle;
  final String? subtitle;

  const Success({required this.mainTitle, this.subtitle});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  SuccessData successData = SuccessData();
  @override
  Widget build(BuildContext context) {
    var userType = context.read<UserCubit>().state.model.typeUser;
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: GenericListView(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .2),
            children: [
              MyText(
                title: widget.mainTitle,
                color: MyColors.black,
                size: 16,
                alien: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: MyText(
                  title: widget.subtitle ?? "",
                  color: MyColors.blackOpacity,
                  size: 15,
                  alien: TextAlign.center,
                ),
              ),
              Image.asset(Res.done, width: 200, height: 200),
            ],
          ),
        ),
        bottomNavigationBar: DefaultButton(
          title: "${tr(context, "main")}",
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          onTap: () {
            if (userType == 1) {
              AutoRouter.of(context)
                  .pushAndPopUntil(HomeRoute(), predicate: (route) => false);
            } else {
              AutoRouter.of(context)
                  .pushAndPopUntil(ProHomeRoute(), predicate: (route) => false);
            }
          },
        ),
      ),
      onWillPop: ()=> successData.onBackPressed(),
    );
  }
}
