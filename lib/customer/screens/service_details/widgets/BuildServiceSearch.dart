part of 'ServiceDetailsWidgetsImports.dart';

class BuildServiceSearch extends StatelessWidget {
  final ServiceDetailsData data;
final int subId;
  const BuildServiceSearch({required this.data,required this.subId});
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
      child: GenericTextField(
        fieldTypes: FieldTypes.normal,
        type: TextInputType.text,
        action: TextInputAction.go,
        validate: (value) => value!.noValidate(),
        hint: "${tr(context, "searchIt")}",
        controller: data.search,
        onChange: (String value) {
          data.searchData(value, context, subId);
        },
        hintColor: MyColors.blackOpacity,
        prefixIcon: Icon(MyFlutterApp.search_1),
        fillColor: MyColors.white,
      ),
    );
  }
}
