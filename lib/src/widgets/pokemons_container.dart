import 'package:flutter/material.dart';
import 'package:pokedex/src/bloc/pokemon_paginate/pokemon_paginate_cubit.dart';
import 'package:pokedex/src/widgets/pokemon_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonsContainer extends StatefulWidget {
  const PokemonsContainer({
    Key? key,
    required this.columnCount,
    required this.maxCards,
  }) : super(key: key);

  final int columnCount;
  final int maxCards;
  @override
  State<PokemonsContainer> createState() => _PokemonsContainerState();
}

class _PokemonsContainerState extends State<PokemonsContainer> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonPaginateCubit, PokemonPaginateState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.columnCount,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int i) {
            return PokemonCard(
              pokemonPaginationResult: state.pokemonList[i],
            );
          },
          itemCount: state.pokemonList.length,
          controller: _scrollController,
        );
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PokemonPaginateCubit>().getPokemonPage(widget.maxCards);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}