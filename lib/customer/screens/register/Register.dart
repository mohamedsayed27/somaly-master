part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterData data = RegisterData();
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'register'),
        leading: Container(),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildRegisterText(),
          BuildSelectPic(
            data: data,
          ),
          BuildRegisterInputs(
            data: data,
          ),
          BuildRegisterTerms(
            data: data,
          ),
          BuildRegisterButton(
            data: data,
          ),
          BuildRegisterHaveAccount(),
        ],
      ),
    );
  }
}
