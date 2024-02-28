part of 'EditProfileWidgetsImports.dart';

class BuildProfileImage extends StatelessWidget {
  final EditProfileData data;

  const BuildProfileImage({required this.data});
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model.customerModel;
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: data.imageCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return DottedBorder(
            borderType: BorderType.Circle,
            dashPattern: [8, 4],
            child: Align(
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
            ),
            padding: EdgeInsets.all(8),
          );
        } else {
          return DottedBorder(
            borderType: BorderType.Circle,
            dashPattern: [8, 4],
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  CachedImage(
                    url: user?.imgProfile ?? "",
                    height: 120,
                    width: 150,
                    haveRadius: false,
                    boxShape: BoxShape.circle,
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
            ),
            padding: EdgeInsets.all(8),
          );
        }
      },
    );
  }
}
