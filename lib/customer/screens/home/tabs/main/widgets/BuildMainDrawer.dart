part of 'MainWidgetsImports.dart';

class BuildMainDrawer extends StatefulWidget {
  final MainPageData mainPageData;

  const BuildMainDrawer({required this.mainPageData});

  @override
  State<BuildMainDrawer> createState() => _BuildMainDrawerState();
}

class _BuildMainDrawerState extends State<BuildMainDrawer> {
  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return SafeArea(
      child: ClipRRect(
        borderRadius: lang == 'ar' ? BorderRadius.only(
          topLeft: Radius.circular(35),
        ): BorderRadius.only(topRight: Radius.circular(35)),
        child: Drawer(
          elevation: 100,
          child: BlocBuilder<GenericBloc<List<ServiceModel>>, GenericState<List<ServiceModel>>>(
            bloc: widget.mainPageData.mainServiceCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BuildCloseDrawerIcon(),
                    Flexible(
                      child: GenericListView(
                        type: ListViewType.normal,
                        children: List.generate(
                          state.data.length,
                              (index) => Column(
                                children: [
                                  BuildDrawerTile(
                            imgURL: Res.logo,
                            title: state.data[index].name,
                            opened: Services(
                                  id: state.data[index].id,
                              deptName: state.data[index].name,
                            ),
                          ),
                                  Divider(thickness: 1.5)
                                ],
                              ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return LoadingDialog.showLoadingDialog();
              }
            },
          ),
        ),
      ),
    );
  }
}
