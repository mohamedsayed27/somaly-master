part of 'ProfileImports.dart';

class ProfileData {
  removeAccount(BuildContext context) async {
    LoadingDialog.showLoadingDialog();
    await CustomerRepository(context).removeAccount();
  }
}
