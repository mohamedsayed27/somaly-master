part of 'ProRegisterWidgetsImports.dart';

class BuildProRegisterAcceptTerms extends StatelessWidget {
  final ProRegisterData data;

  const BuildProRegisterAcceptTerms({required this.data});
  @override
  Widget build(BuildContext context) {
    return Row(
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
                title: tr(context,'AgreeToTheTermsAndConditions'),
                color: MyColors.black,
                size: 9,
              ),
              MyText(
                title: tr(context, "conditions"),
                color: MyColors.primary,
                decoration: TextDecoration.underline,
                size: 11,
              ),
            ],
          ),
        )
      ],
    );
  }
}
