part of 'pokemon_paginate_cubit.dart';

class PokemonPaginateState extends Equatable {
  const PokemonPaginateState({
    this.pokemonList = const [],
    this.isLoadingMore = false,
    this.currentOffset = 0,
    this.hasMore = true,
    this.errorMessage,
  });

  final List<PokemonPaginationResult> pokemonList;
  final bool isLoadingMore;
  final int currentOffset;
  final bool hasMore;
  final String? errorMessage;

  @override
  List<Object> get props =>
      [pokemonList, isLoadingMore, currentOffset, hasMore];

  PokemonPaginateState copyWith({
    List<PokemonPaginationResult>? pokemonList,
    bool? isLoadingMore,
    int? currentOffset,
    bool? hasMore,
    String? errorMessage,
  }) {
    return PokemonPaginateState(
      pokemonList: pokemonList ?? this.pokemonList,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      currentOffset: currentOffset ?? this.currentOffset,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
