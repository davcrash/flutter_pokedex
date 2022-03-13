import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../model/main.dart';

class PokemonAppBar extends StatefulWidget {
  const PokemonAppBar({Key? key, required this.pokemonPaginationResult})
      : super(key: key);
  final PokemonPaginationResult pokemonPaginationResult;

  @override
  State<PokemonAppBar> createState() => _PokemonAppBarState();
}

class _PokemonAppBarState extends State<PokemonAppBar>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<PokemonDetailsCubit, PokemonDetailsState>(
      listener: (context, state) {
        if (state is PokemonDetailsLoaded) {
          _controller.forward();
        }
      },
      builder: (context, state) {
        final color = (state is PokemonDetailsLoaded)
            ? typeColors[state.pokemon.types!.first.type!.name]
            : null;
        final animation = ColorTween(
          begin: theme.appBarTheme.backgroundColor,
          end: color,
        ).animate(_controller);
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return SliverAppBar(
              backgroundColor: _controller.isCompleted ? color : null,
              floating: true,
              pinned: true,
              expandedHeight: 400.0,
              flexibleSpace: child,
            );
          },
          child: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "No. ${widget.pokemonPaginationResult.number} ${toBeginningOfSentenceCase(widget.pokemonPaginationResult.name)}",
              style: theme.appBarTheme.titleTextStyle!.copyWith(height: .8),
              overflow: TextOverflow.ellipsis,
            ),
            background: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  color: animation.value,
                  child: child!,
                );
              },
              child: Center(
                child: Hero(
                  tag: widget.pokemonPaginationResult.number,
                  child: Transform.scale(
                    scale: 3.5,
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemonPaginationResult.imageUrl,
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
