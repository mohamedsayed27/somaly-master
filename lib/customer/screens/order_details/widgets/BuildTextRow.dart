part of 'OrderDetailsWidgetsImports.dart';

class BuildTextRow extends StatelessWidget {
  final String title;
  final String? value;
  final bool? showDivider;

  const BuildTextRow({
    required this.title,
    this.value,
    this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              MyText(
                title: "$title :",
                color: MyColors.black,
                size: 12,
              ),
              SizedBox(width: 10),
              Visibility(
                visible: value != null,
                child: Expanded(
                  child: MyText(
                    title: value ?? "",
                    color: MyColors.blackOpacity,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showDivider ?? true,
          child: Divider(thickness: 1),
        ),
      ],
    );
  }
}
