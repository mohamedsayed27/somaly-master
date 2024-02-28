part of 'RegisterWidgetsImports.dart';

class BuildSelectPic extends StatelessWidget {
  final RegisterData data;

  const BuildSelectPic({required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: data.imageCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: MyColors.grey),
                    image: DecorationImage(
                      image: FileImage(state.data!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.primary,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: MyColors.white,
                      ),
                      onPressed: () => data.getImage(),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: MyColors.grey),
              // image: DecorationImage(
              //   image: AssetImage(Res.placeholder),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () => data.getImage(),
            ),
          );
        }
      },
    );

    // return BlocBuilder<GenericBloc<File>, GenericState<File>>(
    //   bloc: data.imageCubit,
    //   builder: (_, state) {
    //     if (state is GenericInitialState) {
    //       return InkWell(
    //         onTap: () => data.getImage(),
    //         child: Container(
    //           height: 90,
    //           width: 90,
    //           padding: EdgeInsets.all(5),
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: FileImage(state.data!),
    //               fit: BoxFit.contain,
    //             ),
    //             color: MyColors.greyWhite,
    //             shape: BoxShape.circle,
    //             border: Border.all(
    //               color: MyColors.white,
    //               width: 2,
    //             ),
    //           ),
    //           child: Icon(
    //             Icons.camera_alt,
    //             color: MyColors.primary,
    //             size: 30,
    //           ),
    //         ),
    //       );
    //     } else {
    //       return InkWell(
    //         onTap: () => data.getImage(),
    //         child: Container(
    //           height: 90,
    //           width: 90,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: FileImage(state.data), fit: BoxFit.contain),
    //               shape: BoxShape.circle),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
