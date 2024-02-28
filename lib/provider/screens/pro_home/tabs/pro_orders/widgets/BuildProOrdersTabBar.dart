part of 'ProOrdersWidgetsImports.dart';

class BuildProOrdersTabBar extends StatelessWidget {
  final ProOrderData data;

  BuildProOrdersTabBar({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: MyColors.primary,
            blurRadius: .5,
            offset: Offset(0, .1),
            spreadRadius: .5,
          ),
        ],
      ),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: data.selectedTabCubit,
        builder: (context, state) {
          return TabBar(
            physics: NeverScrollableScrollPhysics(),
            onTap: data.selectedTabCubit.onUpdateData,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(horizontal: 3),
            tabs: [
              BuildTabItem(
                title: tr(context, "currentOrders"),
                index: 0,
                current: state.data,
              ),
              // BuildTabItem(
              //   title: 'طلبات قيد التنفيذ',
              //   index: 1,
              //   current: state.data,
              // ),
              BuildTabItem(
                title: tr(context, "finishedOrders"),
                index: 1,
                current: state.data,
              ),
            ],
          );
        },
      ),
    );
  }
}
