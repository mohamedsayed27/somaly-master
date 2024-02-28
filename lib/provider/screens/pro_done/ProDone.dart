part of 'ProDoneImports.dart';

class ProDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MyText(
              title: tr(context, "sentSuccessful"),
              color: MyColors.black,
              size: 13,
            ),
          ),
          Image.asset(
            Res.done,
            height: 250,
          ),
        ],
      ),
      bottomNavigationBar: DefaultButton(
        title: tr(context, 'home'),
        onTap: () => AutoRouter.of(context).push(ProHomeRoute()),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      ),
    );
  }
}
