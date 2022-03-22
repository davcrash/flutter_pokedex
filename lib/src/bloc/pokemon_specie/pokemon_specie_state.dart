part of 'pokemon_specie_cubit.dart';

abstract class PokemonSpecieState extends Equatable {
  const PokemonSpecieState();

  @override
  List<Object> get props => [];
}

class PokemonSpecieLoading extends PokemonSpecieState {}

class PokemonSpecieLoaded extends PokemonSpecieState {
  final PokemonSpecie pokemonSpecie;

  const PokemonSpecieLoaded(this.pokemonSpecie);

  @override
  List<Object> get props => [pokemonSpecie];
}

class PokemonSpecieFailure extends PokemonSpecieState {
  final String msg;

  const PokemonSpecieFailure(this.msg);

  @override
  List<Object> get props => [msg];
}
