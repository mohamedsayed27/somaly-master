part of 'StudentServicesWidgetsImports.dart';

class BuildSearchRow extends StatelessWidget {
  final ServiceData data;
  final int id;

  const BuildSearchRow({required this.data, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MyColors.greyWhite,
            blurRadius: 5,
            offset: Offset(0, 5),
            spreadRadius: .1,
          ),
        ],
      ),
      child: BlocBuilder<GenericBloc<List<ServiceModel>>,
          GenericState<List<ServiceModel>>>(
        bloc: data.servicesCubit,
        builder: (context, state) {
          return GenericTextField(
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.go,
            controller: data.search,
            validate: (value) => value!.noValidate(),
            hint: "${tr(context, "searchIt")}",
            onChange: (String value) {
              data.searchData(value, context, id);
            },
            hintColor: MyColors.blackOpacity,
            prefixIcon: Icon(MyFlutterApp.search_1),
            fillColor: MyColors.white,
          );
        },
      ),
    );
  }
}
