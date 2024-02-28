import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Image(
        height: 140,
        width: 140,
        image: AssetImage(Res.logo),
        fit: BoxFit.contain,
      ),
    );
  }
}
