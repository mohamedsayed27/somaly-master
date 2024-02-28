part of 'ProProfileWidgetsImports.dart';

class BuildEditCommercialRegistrationImg extends StatelessWidget {
  final ProProfileData data;

  const BuildEditCommercialRegistrationImg({required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericBloc<File?>, GenericState<File?>>(
      bloc: data.commercialRegisterImgCubit,
      listener: (context, state) {
        if (state.data != null) {
          data.commercialRegister.text = state.data!.path.split("/").last;
        }
      },
      builder: (context, state) {
        if (state.data == null) {
          return Column(
            children: [
              GenericTextField(
                fieldTypes: FieldTypes.clickable,
                hint: "${tr(context, "commercialRegistrationNo")} (${tr(context, 'optional')})",
                controller: data.commercialRegister,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onTab: () => data.setCommercialRegisterImg(),
                validate: (value) => value!.noValidate(),
                suffixIcon: Icon(Icons.upload_rounded),
              ),
              Visibility(
                visible: data.commercialRegister.text.isNotEmpty,
                child: Stack(
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
                        ),
                        child: CachedImage(
                          url: data.commercialRegister.text,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      left: 0,
                      right: 230,
                      child: GestureDetector(
                        onTap: data.setCommercialRegisterImg,
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
              ),
            ],
          );
        } else {
          return Column(
            children: [
              GenericTextField(
                prefixIcon: Icon(Icons.image_outlined),
                fieldTypes: FieldTypes.clickable,
                hint: "${tr(context, "carPicture")} (${tr(context, 'optional')})",
                controller: data.commercialRegister,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onTab: () => data.setCommercialRegisterImg(),
                validate: (value) => value!.validateEmpty(context),
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
                      onTap: data.setCommercialRegisterImg,
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
