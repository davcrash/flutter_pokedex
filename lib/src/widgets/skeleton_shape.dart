import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonShape extends StatelessWidget {
  const SkeletonShape({
    Key? key,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SkeletonAnimation(
      child: Container(
        decoration: BoxDecoration(
          color: theme.disabledColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
