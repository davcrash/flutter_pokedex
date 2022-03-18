import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_details/pokemon_details_cubit.dart';

import '../model/main.dart';
import '../repository/pokemon_repository.dart';
import '../widgets/pokemon_app_bar.dart';
import '../widgets/pokemon_details.dart';
import '../widgets/pokemon_stats.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    Key? key,
    required this.pokemonPaginationResult,
  }) : super(key: key);
  final PokemonPaginationResult pokemonPaginationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PokemonDetailsCubit(
          context.read<PokemonRepository>(),
        )..getPokemon(int.parse(pokemonPaginationResult.number)),
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
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const PokemonStats()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
