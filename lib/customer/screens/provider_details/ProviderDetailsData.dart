part of 'ProviderDetailsImports.dart';

class ProviderDetailsData {
  late GenericBloc<bool> followCubit;

  setFollow(BuildContext context, String providerId) async {
    var data = await CustomerRepository(context).addFollowCustomer(providerId);
    if (data) {
      followCubit.onUpdateData(true);
    }
  }

  unFollow(BuildContext context, String providerId) async {
    bool result = await CustomerRepository(context).unFollowProvider(providerId);
    if (result == true) {
      followCubit.onUpdateData(false);
    }
  }

}
