import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/screens/details/widgets/pokemon_stats_skeleton.dart';
import 'package:pokedex/src/screens/details/widgets/stats_graph.dart';

import '../../../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../../../widgets/error_message.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          return const PokemonStatsSkeleton();
        } else if (state is PokemonDetailsLoaded) {
          return StatsGraph(
            stats: state.pokemon.stats!,
            type: state.pokemon.types!.first,
          );
        }
        return const ErrorMessage();
      },
    );
  }
}
