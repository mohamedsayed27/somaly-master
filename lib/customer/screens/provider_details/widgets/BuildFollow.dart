part of 'ProviderDetailsWidgetsImports.dart';

class BuildFollow extends StatelessWidget {
  final ProviderDetailsData data;
  final String? providerId;
  const BuildFollow({required this.data, required this.providerId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: data.followCubit,
      builder: (context, state) {
        return InkWell(
          onTap: (){
            if(state.data == true){
              print("=================> $providerId");
              data.unFollow(context, providerId!);
            } else {
              print("=================> $providerId");
              data.setFollow(context, providerId!);
            }
          },
          child: Container(
            width: 90,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: state.data ? MyColors.white : MyColors.primary,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: state.data ? MyColors.primary : MyColors.white,
                width: 1,
              ),
            ),
            child: MyText(
              title: state.data ? "${tr(context, "cancelFollow")}" : "${tr(context, "follow")}  +",
              size: 11,
              fontWeight: FontWeight.bold,
              color: state.data ? MyColors.primary : MyColors.white,
            ),
          ),
        );
      },
    );
  }
}
