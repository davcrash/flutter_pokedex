import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/src/model/main.dart';
import 'package:pokedex/src/repository/pokemon_repository.dart';

part 'pokemon_paginate_state.dart';

class PokemonPaginateCubit extends Cubit<PokemonPaginateState> {
  PokemonPaginateCubit(this._pokemonRepository)
      : super(const PokemonPaginateState());

  final PokemonRepository _pokemonRepository;

  void getPokemonPage(int limit, int offset) async {
    emit(state.copyWith(isLoadingMore: true));
    final pagination = await _pokemonRepository.getPokemonList(
      limit: limit,
      offset: offset,
    );
    final currentPokemonList = state.pokemonList;
    final newPokemonList = [
      ...currentPokemonList,
      ...pagination.results,
    ];
    emit(state.copyWith(isLoadingMore: false, pokemonList: newPokemonList));
  }
}
