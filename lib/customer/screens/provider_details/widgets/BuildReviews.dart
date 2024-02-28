part of 'ProviderDetailsWidgetsImports.dart';

class BuildReviews extends StatelessWidget {
  final List<ProviderRateModel> model;
  const BuildReviews({required this.model});

  @override
  Widget build(BuildContext context) {
    GenericBloc<bool> expandCubit = GenericBloc(false);

    return Container(
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: expandCubit,
        builder: (context, state) {
          return Column(
            children: [
              InkWell(
                onTap: () => expandCubit.onUpdateData(!expandCubit.state.data),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: '${tr(context, "Reviews")} (${model.length.toString()})',
                        color: MyColors.primary,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(
                        state.data
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Visibility(
                  visible: expandCubit.state.data,
                  child: Column(
                    children: List.generate(
                      model.length,
                      (index) => BuildReviewCard(
                        userImgURL:
                            model[index].img??'',
                        userName: model[index].clientName,
                        reviewText: model[index].comment??'',
                        rate: model[index].rate??0,
                        date: model[index].date??'',
                      ),
                    ),
                    // Divider(thickness: 1.5, height: 5),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
