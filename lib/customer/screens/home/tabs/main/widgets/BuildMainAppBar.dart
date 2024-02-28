part of 'MainWidgetsImports.dart';

class BuildMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildMainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var type = context.read<UserCubit>().state.model.typeUser;
    return DefaultAppBar(
      title:
          type == 1 ? '${tr(context, "main")}' : '${tr(context, "groupChat")}',
      showBack: true,
      leading: type == 1
          ? Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: MyColors.white,
                  size: 30,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            })
          : null,
      actions: [
        type == 1
            ? IconButton(
                icon: Icon(MyFlutterApp.user, color: MyColors.white),
                onPressed: () => AutoRouter.of(context).push(ProfileRoute()),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}
