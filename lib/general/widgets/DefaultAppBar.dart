import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size;
  final bool? showBack;

  DefaultAppBar({
    required this.title,
    this.actions = const [],
    this.leading,
    this.size,
    this.showBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
        title: "$title",
        size: 13,
        color: MyColors.white,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: MyColors.primary,
      elevation: 0,
      leading: Visibility(
        visible: showBack ?? false,
        child: leading ??
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: MyColors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
