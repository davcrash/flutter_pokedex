import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/skeleton_shape.dart';

class PokemonDescriptionSkeleton extends StatelessWidget {
  const PokemonDescriptionSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Description",
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.textTheme.caption!.color),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              minWidth: 450,
              maxWidth: 450,
              maxHeight: theme.textTheme.titleMedium!.fontSize! * 4,
              minHeight: theme.textTheme.titleMedium!.fontSize! * 4,
            ),
            child: Column(
              children: [
                SkeletonShape(
                  height: theme.textTheme.titleMedium!.fontSize,
                  width: 400,
                ),
                const SizedBox(height: 5),
                SkeletonShape(
                  height: theme.textTheme.titleMedium!.fontSize,
                  width: 300,
                ),
                const SizedBox(height: 5),
                SkeletonShape(
                  height: theme.textTheme.titleMedium!.fontSize,
                  width: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
