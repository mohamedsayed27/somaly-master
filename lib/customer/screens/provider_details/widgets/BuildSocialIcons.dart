part of 'ProviderDetailsWidgetsImports.dart';

class BuildSocialIcons extends StatelessWidget {
  final String link;
  const BuildSocialIcons({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: IconButton(
        onPressed: ()=> Utils.launchURL(url: link),
        icon: Icon(
          MdiIcons.whatsapp, size: 40,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
