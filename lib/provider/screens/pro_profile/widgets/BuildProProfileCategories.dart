part of 'ProProfileWidgetsImports.dart';

class BuildProProfileCategories extends StatelessWidget {
  final ProProfileData profileData;

  const BuildProProfileCategories({required this.profileData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenericBloc<List<MultiDropDownModel>>,
              GenericState<List<MultiDropDownModel>>>(
            bloc: profileData.mainCatsCubit,
            builder: (context, state) {
              return MultiDropDownField<MultiDropDownModel>(
                fillColor: MyColors.white,
                selectedItems: state.data,
                borderColor: MyColors.blackOpacity,
                label: tr(context, "categories"),
                title: tr(context, "categories"),
                onConfirm: (List<MultiDropDownModel>? data) {
                  profileData.mainCatsCubit.onUpdateData(data??[]);
                  profileData.subCatsCubit.onUpdateData([]);
                },
                onFind: () async => await profileData.getCategories(context),
                onItemClick: (MultiDropDownModel item) {},
              );
            },
          ),
          SizedBox(height: 10),
          BlocBuilder<GenericBloc<List<MultiDropDownModel>>,
              GenericState<List<MultiDropDownModel>>>(
            bloc: profileData.subCatsCubit,
            builder: (context, state) {
              print("============================>${state is GenericUpdateState}");
              var ids = profileData.mainCatsCubit.state.data.map((e) => e.id).toList();
              return MultiDropDownField<MultiDropDownModel>(
                dropkey: state is GenericUpdateState? GlobalKey() : null,
                selectedItems: state.data,
                fillColor: MyColors.white,
                borderColor: MyColors.blackOpacity,
                title: tr(context, "subsections"),
                label: tr(context, "subsections"),
                onConfirm: (List<MultiDropDownModel>? data) {
                  profileData.subCatsCubit.onUpdateData(data??[]);
                },
                onFind: () async => await ProviderRepository(context).getSubCat(ids),
                onItemClick: (MultiDropDownModel item) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
