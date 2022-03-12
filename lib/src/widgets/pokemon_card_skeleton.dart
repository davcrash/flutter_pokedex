import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/skeleton_shape.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            child: Transform.scale(
              scale: 1.2,
              child: const Image(
                image: AssetImage('assets/loading_pokemon.png'),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SkeletonShape(
                  height: textTheme.bodyText2!.fontSize,
                  width: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: textTheme.headline6!.height ?? 1,
                ),
              ),
              SkeletonShape(
                height: textTheme.headline6!.fontSize,
                width: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 7,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
