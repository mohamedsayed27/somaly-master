import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

class Done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var type = context.watch<UserCubit>().state.model.typeUser;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            MyText(
              title: tr(context, "activeDone"),
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyText(
                title: tr(context, "congratulation"),
                color: MyColors.black,
                alien: TextAlign.center,
                size: 11,
              ),
            ),
            Spacer(),
            Image.asset(
              Res.done,
              height: 200,
              width: 200,
            ),
            Spacer(),
            DefaultButton(
              title: tr(context, 'login'),
              onTap: () => AutoRouter.of(context).push(LoginRoute(typeUser: type!)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
