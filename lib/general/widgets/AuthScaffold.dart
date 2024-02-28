import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget appBar;

  AuthScaffold({
    required this.child,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: MyColors.white,
      body: child,
    );
  }
}
