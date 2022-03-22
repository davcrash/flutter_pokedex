import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/model/main.dart';

import '../../repository/pokemon_repository.dart';
import '../pokemon_specie/pokemon_specie_cubit.dart';

part 'pokemon_evolution_chain_state.dart';

class PokemonEvolutionChainCubit extends Cubit<PokemonEvolutionChainState> {
  PokemonEvolutionChainCubit(
    this._pokemonRepository,
    this._specieCubit,
  ) : super(PokemonEvolutionChainLoading()) {
    subscription = _specieCubit.stream.listen((state) {
      if (state is PokemonSpecieLoaded) {
        final evolutionUrl = state.pokemonSpecie.evolutionChain.url;
        final splitUrl = evolutionUrl.split("/");
        final evolutionNumber = splitUrl[splitUrl.length - 2];
        getPokemonEvolutionChain(int.parse(evolutionNumber));
      }
    });
  }

  final PokemonRepository _pokemonRepository;
  final PokemonSpecieCubit _specieCubit;
  late StreamSubscription subscription;

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  void getPokemonEvolutionChain(int id) async {
    try {
      final evolution = await _pokemonRepository.getPokemonEvolutionChain(id);
      emit(PokemonEvolutionChainLoaded(evolution));
    } catch (e) {
      emit(PokemonEvolutionChainFailure(e.toString()));
    }
  }
}
