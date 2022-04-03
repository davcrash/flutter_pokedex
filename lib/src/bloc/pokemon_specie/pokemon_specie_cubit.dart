import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/model/main.dart';

import '../../repository/pokemon_repository.dart';

part 'pokemon_specie_state.dart';

class PokemonSpecieCubit extends Cubit<PokemonSpecieState> {
  PokemonSpecieCubit(this._pokemonRepository) : super(PokemonSpecieLoading());

  final PokemonRepository _pokemonRepository;

  void getPokemonSpecie(int id) async {
    try {
      final specie = await _pokemonRepository.getPokemonSpecie(id);
      emit(PokemonSpecieLoaded(specie));
    } catch (e, s) {
      print(s);
      print(e);
      emit(PokemonSpecieFailure(e.toString()));
    }
  }
}
