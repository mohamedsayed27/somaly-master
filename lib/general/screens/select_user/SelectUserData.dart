part of 'SelectUserImports.dart';

class SelectUserData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  navigateToLogin(BuildContext context, int typeUser) {
    var user = context.read<UserCubit>().state.model;
    user.typeUser = typeUser;
    context.read<UserCubit>().onUpdateUserData(user);
    AutoRouter.of(context).push(LoginRoute(typeUser: typeUser));
  }
}
