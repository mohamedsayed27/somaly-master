part of 'ProServicesWidgetsImports.dart';

class BuildProServicesItem extends StatelessWidget {
  final DropDownModel model;

  const BuildProServicesItem({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedImage(
              url: model.img,
              height: 60,
              width: 50,
              haveRadius: true,
              borderRadius: BorderRadius.circular(15),
              bgColor: MyColors.primary,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(
            title: model.name,
            color: MyColors.black,
            size: 12,
          ),
        ],
      ),
    );
  }
}
