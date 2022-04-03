import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_paginate/pokemon_paginate_cubit.dart';
import 'package:pokedex/src/repository/pokemon_repository.dart';
import 'package:pokedex/src/screens/main/widgets/pokemons_container.dart';

import '../../responsive/responsive_layout.dart';
import 'widgets/pokeball.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const widthCard = 150.0;
    const heightCard = 150.0;
    final width = size.width < maxMobileWidth ? size.width : size.width - 200;
    final height = size.height;
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
        child: ResponsiveLayout(
          mobileBody: PokemonsContainer(
            columnCount: columnCount,
            maxCards: maxCards,
          ),
          desktopBody: PokemonsContainer(
            columnCount: columnCount,
            maxCards: maxCards,
            isDesktop: true,
          ),
        ),
      ),
    );
  }
}
