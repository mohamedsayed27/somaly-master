part of 'ServicesImports.dart';

class ServiceData {
  final GenericBloc<List<ServiceModel>> servicesCubit = GenericBloc([]);
  final TextEditingController search = TextEditingController();

  fetchData(BuildContext context, int id, {bool refresh = true}) async {
    final data = await CustomerRepository(context).getSubServices([id], refresh);
    servicesCubit.onUpdateData(data);
    print("============================>  $data");
  }

  // searchData(String value) async {
  //   // servicesCubit.state.data
  //   //     .where((element) => element.name.toLowerCase().contains(value))
  //   //     .toList();
  //   servicesCubit.state.data
  //       .map((e) => value)
  //       .contains(value)
  //       .where((e) => e.name.startsWith(value))
  //       .map((e) {
  //     servicesCubit.state.data.add(e);
  //     return servicesCubit.onUpdateData(servicesCubit.state.data);
  //   }).toList();
  // }

  void searchData(String text, BuildContext context, int id) {
    if(text != ''){
      var filtered = servicesCubit.state.data
          .where((element) =>
          element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      servicesCubit.onUpdateData(filtered);
    } else {
      fetchData(context, id);
    }
  }
}
