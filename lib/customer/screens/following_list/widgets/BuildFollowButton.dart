part of 'FollowingListWidgetsImports.dart';

class BuildFollowButton extends StatelessWidget {
  const BuildFollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GenericBloc<bool> followCubit = GenericBloc(true);

    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: followCubit,
      builder: (context, state) {
        return InkWell(
          onTap: () => followCubit.onUpdateData(!state.data),
          child: Container(
            width: 90,
            height: 30,
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
              title: state.data ? "${tr(context, "cancelFollow")}" : " ${tr(context, "follow")}",
              size: 10,
              fontWeight: FontWeight.bold,
              color: state.data ? MyColors.primary : MyColors.white,
            ),
          ),
        );
      },
    );
  }
}
