import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/skeleton_shape.dart';

class PokemonMovesSkeleton extends StatelessWidget {
  const PokemonMovesSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Moves",
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.textTheme.caption!.color),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: getGroupedMovesWidgets([1, 1, 1], theme),
        ),
      ],
    );
  }

  List<Widget> getGroupedMovesWidgets(List<int> groupedMoves, ThemeData theme) {
    return groupedMoves.map((key) {
      final random = Random();
      final itemCount = random.nextInt(20) + 5;
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: SizedBox(
          width: 180,
          child: Column(
            children: [
              SkeletonShape(
                height: theme.textTheme.titleSmall!.fontSize,
                width: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: SkeletonShape(
                      height: theme.textTheme.titleSmall!.fontSize,
                      width: 40,
                    ),
                  ),
                  SkeletonShape(
                    height: theme.textTheme.titleSmall!.fontSize,
                    width: 20,
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: SkeletonShape(
                            height: theme.textTheme.bodyText2!.fontSize,
                            width: 40 + random.nextInt(30).toDouble(),
                          ),
                        ),
                        SkeletonShape(
                          height: theme.textTheme.bodyText2!.fontSize,
                          width: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
