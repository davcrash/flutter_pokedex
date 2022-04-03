import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/skeleton_shape.dart';

class PokemonStatsSkeleton extends StatelessWidget {
  const PokemonStatsSkeleton({Key? key}) : super(key: key);
  final barHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 6; i++)
          Container(
            constraints: const BoxConstraints(
              maxWidth: 50,
            ),
            width: 50,
            child: Column(
              children: [
                SizedBox(
                  height: barHeight,
                  width: 40,
                ),
                SizedBox(
                  height: 40,
                  child: SkeletonShape(
                    height: theme.textTheme.titleSmall!.fontSize,
                    width: 40,
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
