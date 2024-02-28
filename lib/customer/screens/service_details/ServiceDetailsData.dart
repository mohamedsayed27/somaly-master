part of 'ServiceDetailsImports.dart';

class ServiceDetailsData {
  final GenericBloc<List<ProviderDetailsModel>> providersCubit =
      GenericBloc([]);
  final TextEditingController search = TextEditingController();

  fetchData(BuildContext context, int subId, {bool refresh = true}) async {
    final data = await CustomerRepository(context).getProviders(subId);
    providersCubit.onUpdateData(data);
  }

  void searchData(String text, BuildContext context, int subId) {
    if(text != ''){
      var filtered = providersCubit.state.data
          .where((element) =>
          element.userName.toLowerCase().contains(text.toLowerCase()))
          .toList();
      providersCubit.onUpdateData(filtered);
    } else {
      fetchData(context, subId);
    }
  }
}
