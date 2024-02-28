part of 'MyOrdersWidgetsImports.dart';

class BuildMyOrdersTabBar extends StatelessWidget {
  final MyOrdersData myOrdersData;

  BuildMyOrdersTabBar({required this.myOrdersData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 50,
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
        bloc: myOrdersData.selectedTabCubit,
        builder: (context, state) {
          return TabBar(
            physics: NeverScrollableScrollPhysics(),
            onTap: myOrdersData.selectedTabCubit.onUpdateData,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(horizontal: 3),
            tabs: [
              BuildTabItem(
                title: '${tr(context, "pendOrdersReq")}',
                index: 0,
                current: state.data,
              ),
              BuildTabItem(
                title: '${tr(context, "OrdersInProgress")}',
                index: 1,
                current: state.data,
              ),
              BuildTabItem(
                title: '${tr(context, "doneOrdersReq")}',
                index: 2,
                current: state.data,
              ),
            ],
          );
        },
      ),
    );
  }
}
