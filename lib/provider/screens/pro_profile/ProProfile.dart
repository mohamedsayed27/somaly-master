part of 'ProProfileImports.dart';

class ProProfile extends StatefulWidget {
  @override
  _ProProfileState createState() => _ProProfileState();
}

class _ProProfileState extends State<ProProfile> {
  final ProProfileData data = ProProfileData();

  @override
  void initState() {
    data.getData(context);
    data.initProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'profile'),
        showBack: true,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: data.userCubit,
        builder: (_, state){
          if(state is UserUpdateState){
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                BuildProSelectPic(data: data),
                BuildProProfileInputs(data: data),
                BuildProProfileCategories(profileData: data),
                BuildProProfileChangePassword(data: data),
                LoadingButton(
                  btnKey: data.btnKey,
                  title: tr(context, 'save'),
                  onTap: () => data.setUpdateProfile(context),
                ),
              ],
            );
          } else {
            return LoadingDialog.showLoadingView();
          }
        },
      ),
    );
  }
}
