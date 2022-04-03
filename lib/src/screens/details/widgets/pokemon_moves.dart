import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:collection/collection.dart";
import 'package:pokedex/src/model/main.dart';
import 'package:pokedex/src/screens/details/widgets/pokemon_moves_skeleton.dart';
import 'package:pokedex/src/screens/details/widgets/pokemon_moves_table.dart';
import '../../../bloc/pokemon_details/pokemon_details_cubit.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          return const PokemonMovesSkeleton();
        } else if (state is PokemonDetailsLoaded) {
          final moves = state.pokemon.moves!
            ..sort((a, b) => a.versionGroupDetails!.first.levelLearnedAt!
                .compareTo(b.versionGroupDetails!.first.levelLearnedAt!));
          final groupedMoves = groupBy(
            moves,
            (Move move) =>
                move.versionGroupDetails!.first.moveLearnMethod!.name,
          );

          final sortedGroupedMoves = SplayTreeMap.from(groupedMoves);

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
                children: getGroupedMovesWidgets(sortedGroupedMoves),
              ),
            ],
          );
        }
        return Container(); //TODO
      },
    );
  }

  List<Widget> getGroupedMovesWidgets(SplayTreeMap groupedMoves) {
    return groupedMoves.entries.map((key) {
      return PokemonMovesTable(
        moves: key.value,
        tableName: key.key!,
      );
    }).toList();
  }
}
