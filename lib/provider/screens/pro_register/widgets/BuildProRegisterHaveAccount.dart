part of 'ProRegisterWidgetsImports.dart';

class BuildProRegisterHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var type = context.watch<UserCubit>().state.model.typeUser;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: tr(context, 'haveAccount'),
            color: MyColors.black,
            size: 12,
          ),
          InkWell(
            onTap: () => AutoRouter.of(context).push(LoginRoute(typeUser: 2)),
            child: MyText(
              title: tr(context, 'login'),
              color: MyColors.primary,
              decoration: TextDecoration.underline,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
