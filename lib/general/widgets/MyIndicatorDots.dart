import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

class MyIndicatorDots extends StatelessWidget {
  final GenericBloc<int>? pagesCubit;
  final int dots;

  MyIndicatorDots({this.pagesCubit, required this.dots});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: pagesCubit,
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: DotsIndicator(
            position: state.data.toDouble(),
            dotsCount: dots,
            decorator: DotsDecorator(
              activeColor: MyColors.primary,
              color: MyColors.grey,
              size: Size(10, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeSize: Size(40, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
