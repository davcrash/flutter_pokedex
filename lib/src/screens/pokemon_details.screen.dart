import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_details/pokemon_details_cubit.dart';

import '../model/main.dart';
import '../repository/pokemon_repository.dart';
import '../widgets/pokemon_app_bar.dart';
import '../widgets/pokemon_details.dart';

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
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return const PokemonDetails();
                  }
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
