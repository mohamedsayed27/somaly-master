part of 'ProRegisterWidgetsImports.dart';

class BuildIdImage extends StatelessWidget {
  final ProRegisterData data;

  const BuildIdImage({required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericBloc<File?>, GenericState<File?>>(
      bloc: data.idImgCubit,
      listener: (context, state) {
        if (state.data != null) {
          data.id.text = state.data!.path.split("/").last;
        }
      },
      builder: (context, state) {
        if (state.data == null) {
          return GenericTextField(
            fieldTypes: FieldTypes.clickable,
            label: "${tr(context, "id")} (${tr(context, 'optional')})",
            controller: data.id,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            onTab: () => data.setIdImage(),
            validate: (value) => value!.noValidate(),
            suffixIcon: Icon(Icons.upload_rounded),
          );
        } else {
          return Column(
            children: [
              GenericTextField(
                prefixIcon: Icon(Icons.image_outlined),
                fieldTypes: FieldTypes.clickable,
                label: "${tr(context, "id")} (${tr(context, 'optional')})",
                controller: data.id,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onTab: () => data.setIdImage(),
                validate: (value) => value!.noValidate(),
                suffixIcon: Icon(Icons.upload_rounded),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 120,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: MyColors.grey, width: .5),
                        image: DecorationImage(
                          image: FileImage(state.data!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    left: 0,
                    right: 230,
                    child: GestureDetector(
                      onTap: data.setIdImage,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.blackOpacity,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: MyColors.blackOpacity,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
