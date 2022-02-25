part of 'pokemon_paginate_cubit.dart';

class PokemonPaginateState extends Equatable {
  const PokemonPaginateState({
    this.pokemonList = const [],
    this.isLoadingMore = true,
    this.errorMessage,
  });

  final List<PokemonPaginationResult> pokemonList;
  final bool isLoadingMore;
  final String? errorMessage;

  @override
  List<Object> get props => [pokemonList, isLoadingMore];

  PokemonPaginateState copyWith({
    List<PokemonPaginationResult>? pokemonList,
    bool? isLoadingMore,
    String? errorMessage,
  }) {
    return PokemonPaginateState(
      pokemonList: pokemonList ?? this.pokemonList,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
