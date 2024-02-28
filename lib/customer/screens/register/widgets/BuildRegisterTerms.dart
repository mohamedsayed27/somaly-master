part of 'RegisterWidgetsImports.dart';

class BuildRegisterTerms extends StatelessWidget {
  final RegisterData data;

  const BuildRegisterTerms({required this.data});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: data.termsCubit,
          builder: (_, state) {
            return Checkbox(
              value: state.data,
              onChanged: (val) => data.termsCubit.onUpdateData(!state.data),
              activeColor: MyColors.primary,
            );
          },
        ),
        InkWell(
          onTap: () => AutoRouter.of(context).push(TermsRoute()),
          child: Row(
            children: [
              MyText(
                title: "${tr(context, "uAgreeWithTerms")}",
                color: MyColors.black,
                size: 8,
              ),
              MyText(
                title: tr(context, "conditions"),
                color: MyColors.primary,
                decoration: TextDecoration.underline,
                size: 8,
              ),
            ],
          ),
        )
      ],
    );
  }
}
