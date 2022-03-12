part of 'pokemon_details_cubit.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();

  @override
  List<Object> get props => [];
}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final Pokemon pokemon;

  const PokemonDetailsLoaded(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class PokemonDetailsFailure extends PokemonDetailsState {
  final String msg;

  const PokemonDetailsFailure(this.msg);

  @override
  List<Object> get props => [msg];
}
