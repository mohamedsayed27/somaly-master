part of 'ProviderDetailsWidgetsImports.dart';

class BuildInfo extends StatelessWidget {
  final String address;
  final String about;
  final ProviderDetailsData data;
  final String? providerId;

  const BuildInfo({
    required this.address,
    required this.about,
    required this.data,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "${tr(context, "address")}",
                size: 14,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
              ),
              BuildFollow(
                data: data,
                providerId: providerId,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                MyFlutterApp.location,
                size: 14,
                color: MyColors.blackOpacity,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: address,
                  color: MyColors.blackOpacity,
                  size: 12,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          MyText(
            title: "${tr(context, "aboutHim")}",
            size: 14,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
          SizedBox(height: 10),
          MyText(
            title: about,
            size: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.blackOpacity,
          ),
        ],
      ),
    );
  }
}
