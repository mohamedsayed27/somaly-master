part of 'ProOrderDetailsWidgetsImports.dart';

class BuildProOrderDetailsPics extends StatelessWidget {
  final OrderDetailsModel model;

  const BuildProOrderDetailsPics({required this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MyText(
            title: tr(context, "attachments"),
            color: MyColors.black,
            size: 14,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: Wrap(
            runSpacing: 15,
            spacing: 15,
            children: List.generate(
              model.imgs.length,
              (index) => CachedImage(
                url: model.imgs[index],
                height: 100,
                width: 100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
