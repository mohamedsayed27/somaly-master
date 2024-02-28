part of 'LanguagesImports.dart';

class LanguagesData {
  final GenericBloc<String> langCubit = GenericBloc("ar");
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();

  final String lang = '';

  void setLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lang = prefs.getString("lang");
    langCubit.onUpdateData(lang ?? "ar");
  }

  setLanguage(BuildContext context) async {
    if (context.read<AuthCubit>().state.authorized) {
      changeLanguage(context);
    } else {
      EasyLoading.dismiss().then((value) {
        Utils.changeLanguage(langCubit.state.data, context);
        Phoenix.rebirth(context);
      });
    }
  }

  void changeLanguage(BuildContext context) async {
    print("aaaaaaaaaaaaaaaa lang : ${langCubit.state.data}");
    btnKey.currentState!.animateForward();
    bool result = await GeneralRepository(context).changeLanguage(langCubit.state.data);
    btnKey.currentState!.animateReverse();
    if (result) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("lang", langCubit.state.data);
      var user = context.read<UserCubit>().state.model;
      user.lang = langCubit.state.data;
      Utils.saveUserData(user);
      Utils.changeLanguage(langCubit.state.data, context);
      Phoenix.rebirth(context);
    } else {
      EasyLoading.dismiss();
    }
  }
}
