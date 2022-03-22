import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_details/pokemon_details_cubit.dart';

import '../bloc/pokemon_evolution_chain/pokemon_evolution_chain_cubit.dart';
import '../bloc/pokemon_specie/pokemon_specie_cubit.dart';
import '../model/main.dart';
import '../repository/pokemon_repository.dart';
import '../widgets/pokemon_app_bar.dart';
import '../widgets/pokemon_description.dart';
import '../widgets/pokemon_details.dart';
import '../widgets/pokemon_evolutions.dart';
import '../widgets/pokemon_stats.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    Key? key,
    required this.pokemonPaginationResult,
  }) : super(key: key);
  final PokemonPaginationResult pokemonPaginationResult;

  @override
  Widget build(BuildContext context) {
    final pokemonId = int.parse(pokemonPaginationResult.number);
    final repository = context.read<PokemonRepository>();
    final pokemonDetailsCubit = PokemonDetailsCubit(repository);
    final pokemonSpecieCubit = PokemonSpecieCubit(repository);
    final pokemonEvolutionChainCubit = PokemonEvolutionChainCubit(
      repository,
      pokemonSpecieCubit,
    );
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonDetailsCubit>(
            create: (_) => pokemonDetailsCubit..getPokemon(pokemonId),
          ),
          BlocProvider<PokemonSpecieCubit>(
            create: (context) => pokemonSpecieCubit
              ..getPokemonSpecie(
                pokemonId,
              ),
          ),
          BlocProvider<PokemonEvolutionChainCubit>(
            create: (context) => pokemonEvolutionChainCubit,
          ),
        ],
        child: CustomScrollView(
          slivers: <Widget>[
            PokemonAppBar(
              pokemonPaginationResult: pokemonPaginationResult,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const PokemonDetails(),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const PokemonStats(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const PokemonDescription(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const PokemonEvolutions(),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  const Padding(padding: EdgeInsets.only(top: 100)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
