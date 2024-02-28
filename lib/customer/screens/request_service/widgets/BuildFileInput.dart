part of 'RequestServiceWidgetsImports.dart';

class BuildFileInput extends StatelessWidget {
  final RequestServicesData data;

  const BuildFileInput({required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          fieldTypes: FieldTypes.clickable,
          label: '${tr(context, "insertFile")}',
          controller: data.addFile,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          onTab: () => data.getImages(),
          validate: (value) => value!.noValidate(),
          suffixIcon: Icon(Icons.upload_rounded),
        ),
        BlocBuilder<GenericBloc<List<File>>, GenericState<List<File>>>(
          bloc: data.fileCubit,
          builder: (_, state){
            if (state.data.isNotEmpty) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(state.data[index]))),
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: () =>
                                    data.removeImage(index),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            size: 30,
                            color: MyColors.blackOpacity,
                          ),
                          onPressed: () => data.getImages(),
                        ),
                      )
                    ],
                  ));
            } else {
              return Container();
            }
          },
        ),
      ],
    );
    // return BlocConsumer<GenericBloc<List<File>>, GenericState<List<File>>>(
    //   bloc: data.fileCubit,
    //   listener: (context, state) {
    //     if (state.data.isNotEmpty) {
    //       data.addFile.text = state.data!.path.split("/").last;
    //     }
    //   },
    //   builder: (context, state) {
    //     if (state.data == null) {
    //       return GenericTextField(
    //         fieldTypes: FieldTypes.clickable,
    //         label: 'ارفاق ملف',
    //         controller: data.addFile,
    //         margin: const EdgeInsets.symmetric(vertical: 10),
    //         action: TextInputAction.next,
    //         type: TextInputType.text,
    //         onTab: () => data.setFile(),
    //         validate: (value) => value!.validateEmpty(context),
    //         suffixIcon: Icon(Icons.upload_rounded),
    //       );
    //     } else {
    //       return Column(
    //         children: [
    //           GenericTextField(
    //             prefixIcon: Icon(Icons.image_outlined),
    //             fieldTypes: FieldTypes.clickable,
    //             label: "صورة السيارة",
    //             controller: data.addFile,
    //             margin: const EdgeInsets.symmetric(vertical: 10),
    //             action: TextInputAction.next,
    //             type: TextInputType.text,
    //             onTab: () => data.setFile(),
    //             validate: (value) => value!.validateEmpty(context),
    //             suffixIcon: Icon(Icons.upload_rounded),
    //           ),
    //           Stack(
    //             children: [
    //               Center(
    //                 child: Container(
    //                   width: 250,
    //                   height: 120,
    //                   margin: const EdgeInsets.symmetric(vertical: 10),
    //                   decoration: BoxDecoration(
    //                     color: MyColors.white,
    //                     borderRadius: BorderRadius.circular(5),
    //                     border: Border.all(color: MyColors.grey, width: .5),
    //                     image: DecorationImage(
    //                       image: FileImage(state.data!),
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Positioned(
    //                 bottom: 3,
    //                 left: 0,
    //                 right: 230,
    //                 child: GestureDetector(
    //                   onTap: data.setFile,
    //                   child: Container(
    //                     padding: EdgeInsets.all(5),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       shape: BoxShape.circle,
    //                       border: Border.all(
    //                         color: MyColors.blackOpacity,
    //                         width: 1,
    //                       ),
    //                     ),
    //                     child: Icon(
    //                       Icons.camera_alt,
    //                       color: MyColors.blackOpacity,
    //                       size: 17,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       );
    //     }
    //   },
    // );
  }
}
