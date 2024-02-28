part of 'ProMoreWidgetsImports.dart';

class BuildSettings extends StatelessWidget {
  final ProMoreData proMoreData;

  const BuildSettings({required this.proMoreData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MyText(
            title: tr(context, "settings"),
            color: MyColors.blackOpacity,
            size: 14,
          ),
        ),
        BuildLangRow(),
        BuildProMoreNotifySettings(
          data: proMoreData,
        ),
      ],
    );
  }
}
