part of 'MoreWidgetsImports.dart';

class BuildUserInfo extends StatelessWidget {
  const BuildUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model.customerModel;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CachedImage(
          url: user?.imgProfile??"",
          borderRadius: BorderRadius.circular(10),
          width: 70,
          height: 70,
        ),
        title: MyText(
          title: user?.userName??"",
          color: MyColors.black,
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        subtitle: MyText(
          title: user?.phone??"",
          color: MyColors.blackOpacity,
          size: 12,
        ),
      ),
    );
  }
}
