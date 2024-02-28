part of 'ConversationsWidgetsImports.dart';

class BuildProSearch extends StatelessWidget {
  final ConversationsData data;

  const BuildProSearch({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
      child: Form(
        key: data.formKey,
        child: GenericTextField(
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          action: TextInputAction.go,
          validate: (value) => value!.noValidate(),
          hint: tr(context, 'search'),
          controller: data.search,
          hintColor: MyColors.blackOpacity,
          prefixIcon: Icon(MyFlutterApp.search_1),
          fillColor: MyColors.white,
        ),
      ),
    );
  }
}
