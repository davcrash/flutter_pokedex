import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/model/main.dart';

import '../../repository/pokemon_repository.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit(this._pokemonRepository) : super(PokemonDetailsLoading());

  final PokemonRepository _pokemonRepository;

  void getPokemon(int id) async {
    try {
      final pokemon = await _pokemonRepository.getPokemon(id);
      emit(PokemonDetailsLoaded(pokemon));
    } catch (e) {
      emit(PokemonDetailsFailure(e.toString()));
    }
  }
}
