part of 'ProRegisterImports.dart';

class ProRegister extends StatefulWidget {
  @override
  _ProRegisterState createState() => _ProRegisterState();
}

class _ProRegisterState extends State<ProRegister> {
  final ProRegisterData data = ProRegisterData();
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        showBack: true,
        title: tr(context, 'register'),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildProRegisterText(),
          BuildProSelectPic(
            data: data,
          ),
          BuildProRegisterInputs(
            data: data,
          ),
          BuildProRegisterAcceptTerms(
            data: data,
          ),
          BuildProRegisterButton(
            data: data,
          ),
          BuildRegisterHaveAccount(),
        ],
      ),
    );
  }
}
