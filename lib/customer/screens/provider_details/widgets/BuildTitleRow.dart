part of 'ProviderDetailsWidgetsImports.dart';

class BuildTitleRow extends StatelessWidget {
  final String providerName;
  final double rate;

  const BuildTitleRow({required this.providerName, required this.rate});

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: providerName,
            size: 14,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
          RatingBarIndicator(
            rating: rate,
            itemCount: 5,
            itemSize: 22,
            textDirection: lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            direction: Axis.horizontal,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
