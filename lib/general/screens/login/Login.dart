part of 'LoginImports.dart';

class Login extends StatefulWidget {
  final int typeUser;
  const Login({required this.typeUser});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: DefaultAppBar(
        title: tr(context, 'login'),
        leading: Container(),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HeaderLogo(),
            BuildText(),
            BuildFormInputs(loginData: loginData, typeUser: widget.typeUser),
            BuildLoginButton(loginData: loginData, typeUser: widget.typeUser),
            // BuildNewRegister(),
            BuildForgetText(),
            BuildRegisterButton(
              loginData: loginData,
            ),
            // BuildLoginAsVisitor(),
          ],
        ),
      ),
    );
  }
}
