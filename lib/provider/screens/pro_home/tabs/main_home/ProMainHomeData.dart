part of 'ProMainHomeImports.dart';

class ProMainHomeData {
  final GenericBloc<double> sliderCubit = GenericBloc(0);

  final GenericBloc<List<OrderModel>> orderModelCubit = GenericBloc([]);
  final GenericBloc<List<AdsModel>> adsModelCubit = GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await ProviderRepository(context).getNewOrders(refresh);
    orderModelCubit.onUpdateData(data.orderModel);
    adsModelCubit.onUpdateData(data.ads);
  }
}
