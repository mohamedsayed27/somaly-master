part of 'FollowingListWidgetsImports.dart';

class BuildFollowingCard extends StatelessWidget {
  final String imgURL;
  final String name;
  final String address;

  const BuildFollowingCard({
    required this.imgURL,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MyColors.grey,
            blurRadius: .1,
            offset: Offset(0, .1),
            spreadRadius: .2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImage(
            url: imgURL,
            fit: BoxFit.fill,
            height: 70,
            width: 70,
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  title: name,
                  color: MyColors.primary,
                  size: 12,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MyFlutterApp.location,
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: MyText(
                        title: address,
                        color: MyColors.blackOpacity,
                        size: 11,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BuildFollowButton(),
        ],
      ),
    );
  }
}
