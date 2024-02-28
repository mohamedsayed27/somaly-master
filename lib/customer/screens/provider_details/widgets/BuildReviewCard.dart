part of 'ProviderDetailsWidgetsImports.dart';

class BuildReviewCard extends StatelessWidget {
  final String userImgURL;
  final String userName;
  final String reviewText;
  final double rate;
  final String date;

  const BuildReviewCard({
    required this.userImgURL,
    required this.userName,
    required this.reviewText,
    required this.rate,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Container(
            //   width: 60,
            //   height: 60,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Image.asset(Res.logo),
            // ),
            CachedImage(
              url: userImgURL,
              width: 60,
              height: 60,
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: userName,
                          color: MyColors.black,
                          size: 12,
                        ),
                        MyText(
                          title: reviewText,
                          color: MyColors.blackOpacity,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RatingBarIndicator(
                          rating: rate,
                          itemCount: 5,
                          itemSize: 22,
                          textDirection: TextDirection.ltr,
                          direction: Axis.horizontal,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyColors.primary,
                          ),
                        ),
                        MyText(
                          title: date,
                          color: MyColors.blackOpacity,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(thickness: 1, height: 15),
      ],
    );
  }
}
