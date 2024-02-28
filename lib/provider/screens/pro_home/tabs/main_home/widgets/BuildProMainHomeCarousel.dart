part of 'ProMainHomeWidgetsImports.dart';

class BuildMainHomeCarousel extends StatelessWidget {
  final ProMainHomeData data;

  const BuildMainHomeCarousel({required this.data});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AdsModel>>,
        GenericState<List<AdsModel>>>(
      bloc: data.adsModelCubit,
      builder: (context, state) {
        return Container(
          height: 210,
          decoration: BoxDecoration(
            color: MyColors.white,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.primary,
                  ),
                ),
              ),
              Container(
                height: 200,
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: CarouselSlider(
                  items: List.generate(
                    state.data.length,
                    (index) => CachedImage(
                        haveRadius: true,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        url: state.data[index].img),
                  ),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onScrolled: (value) {
                      data.sliderCubit.onUpdateData(value!);
                    },
                  ),
                ),
                // Swiper(
                //   itemBuilder: (BuildContext context, int index) {
                //     return InkWell(
                //       // onTap: () => AutoRouter.of(context)
                //       //     .push(ImageZoomRoute(images: sliders[index].url)),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 2.0),
                //         child: CachedImage(
                //           fit: BoxFit.fill,
                //           borderRadius: BorderRadius.circular(5),
                //           url: "sliders[index].img",
                //         ),
                //       ),
                //     );
                //   },
                //   // pagination: new SwiperPagination(),
                //   itemCount: 3,
                //   // itemCount: sliders.length,
                //   autoplay: true,
                //   layout: SwiperLayout.DEFAULT,
                // ),
              ),
            ],
          ),
        );
      },
    );
  }
}
