part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = new ContactUsData();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "contactUs"),
        showBack: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(Res.logo),
            ),
            BuildContactUsForm(contactUsData: contactUsData),
            LoadingButton(
              btnKey: contactUsData.btnKey,
              title: tr(context, "send"),
              margin: EdgeInsets.symmetric(vertical: 20),
              onTap: () => contactUsData.sendMessage(context),
            ),
          ],
        ),
      ),
    );
  }
}
