part of 'ProServicesImports.dart';

class ProServicesData {
  final GenericBloc<List<DropDownModel>> mainServicesCubit = GenericBloc([]);

  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await ProviderRepository(context).getMainServices(refresh);
    mainServicesCubit.onUpdateData(data);
  }
}
