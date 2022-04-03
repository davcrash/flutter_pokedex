import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/pokemon_card_skeleton.dart';

class PokemonEvolutionsSkeleton extends StatelessWidget {
  final cardHeight = 200.0;
  const PokemonEvolutionsSkeleton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Evolutions",
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.textTheme.caption!.color),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: _getPokemonCardList([1, 1]),
        ),
      ],
    );
  }

  List<Widget> _getPokemonCardList(List<int> evolutions) {
    return evolutions
        .map(
          (evolution) => SizedBox(
            width: 150,
            height: cardHeight,
            child: const PokemonCardSkeleton(),
          ),
        )
        .toList();
  }
}
