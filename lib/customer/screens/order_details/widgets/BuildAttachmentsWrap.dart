part of 'OrderDetailsWidgetsImports.dart';

class BuildAttachmentsWrap extends StatelessWidget {
  final OrderDetailsModel model;

  const BuildAttachmentsWrap({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
