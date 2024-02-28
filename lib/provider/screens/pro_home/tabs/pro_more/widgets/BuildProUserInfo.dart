part of 'ProMoreWidgetsImports.dart';

class BuildProUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.model.providerModel;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CachedImage(
          url: user!.imgProfile ?? "",
          borderRadius: BorderRadius.circular(10),
          width: 70,
          height: 70,
        ),
        title: MyText(
          title: user.userName ?? "",
          color: MyColors.black,
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        subtitle: MyText(
          title: user.email ?? "",
          color: MyColors.blackOpacity,
          size: 12,
        ),
      ),
    );
  }
}
