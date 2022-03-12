import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../model/main.dart';

class PokemonAppBar extends StatelessWidget {
  const PokemonAppBar({Key? key, required this.pokemonPaginationResult})
      : super(key: key);
  final PokemonPaginationResult pokemonPaginationResult;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        final color = (state is PokemonDetailsLoaded)
            ? typeColors[state.pokemon.types!.first.type!.name]
            : null;
        return SliverAppBar(
          backgroundColor: color,
          floating: true,
          pinned: true,
          expandedHeight: 400.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "${pokemonPaginationResult.name[0].toUpperCase()}${pokemonPaginationResult.name.substring(1)}",
              //TODO: cambiar todo google fonts
              style: Theme.of(context)
                  .appBarTheme
                  .titleTextStyle!
                  .copyWith(height: .8),
              overflow: TextOverflow.ellipsis,
            ),
            background: Container(
              color: color,
              child: Center(
                child: Hero(
                  tag: pokemonPaginationResult.number,
                  child: Transform.scale(
                    scale: 3.5,
                    child: CachedNetworkImage(
                      imageUrl: pokemonPaginationResult.imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.warning),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
