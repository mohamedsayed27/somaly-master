part of 'ContactUsImports.dart';

class ContactUsData {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController name = new TextEditingController();
  final TextEditingController mail = new TextEditingController();
  final TextEditingController msg = new TextEditingController();

  void sendMessage(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var data = await GeneralRepository(context)
          .contactUs(name: name.text, mail: mail.text, message: msg.text);
      if (data == true) {
        name.clear();
        mail.clear();
        msg.clear();
        CustomToast.showSimpleToast(msg: '${tr(context, "thanksForContact")}');
      }
      btnKey.currentState!.animateReverse();
    }
  }
}
