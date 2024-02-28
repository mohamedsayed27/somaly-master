part of 'EditProfileImports.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final EditProfileData data = EditProfileData();
  @override
  void initState() {
    data.initProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "profile")}", showBack: true),
      body: GenericListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          BuildProfileImage(
            data: data,
          ),
          BuildInputFields(
            data: data,
          ),
        ],
      ),
      bottomNavigationBar: BuildNavigationButtons(
        data: data,
      ),
    );
  }
}
