import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

class NoData extends StatelessWidget {
  const NoData({
    required this.title,
    this.message,
    this.onTryAgain,
  });
  final String title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              MyText(
                title: '$title',
                size: 16,
                color: MyColors.white,
                alien: TextAlign.center,
              ),
              if (message != null)
                const SizedBox(
                  height: 16,
                ),
              if (message != null)
                MyText(
                  title: '$message',
                  size: 16,
                  color: MyColors.white,
                  alien: TextAlign.center,
                ),
              if (onTryAgain != null)
                const SizedBox(
                  height: 48,
                ),
              if (onTryAgain != null)
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onTryAgain,
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: MyText(
                      title: 'Try Again',
                      size: 16,
                      color: MyColors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
