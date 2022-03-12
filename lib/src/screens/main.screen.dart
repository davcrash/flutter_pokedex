import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/src/bloc/pokemon_paginate/pokemon_paginate_cubit.dart';
import 'package:pokedex/src/repository/pokemon_repository.dart';
import 'package:pokedex/src/widgets/pokemons_container.dart';

import '../widgets/pokeball.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    const widthCard = 150;
    const heightCard = 150;
    final columnCount = width ~/ widthCard;
    final maxRow = height ~/ heightCard;
    final maxCards = columnCount * maxRow;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Pokeball(
              size: 35,
            ),
            const Padding(padding: EdgeInsets.all(2)),
            Text(
              "Pokedex",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => PokemonPaginateCubit(
          context.read<PokemonRepository>(),
        )..getPokemonPage(maxCards),
        child: PokemonsContainer(
          columnCount: columnCount,
          maxCards: maxCards,
        ),
      ),
    );
  }
}
