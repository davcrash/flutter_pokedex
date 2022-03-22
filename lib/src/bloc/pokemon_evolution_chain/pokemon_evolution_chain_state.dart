part of 'pokemon_evolution_chain_cubit.dart';

abstract class PokemonEvolutionChainState extends Equatable {
  const PokemonEvolutionChainState();

  @override
  List<Object> get props => [];
}

class PokemonEvolutionChainLoading extends PokemonEvolutionChainState {}

class PokemonEvolutionChainLoaded extends PokemonEvolutionChainState {
  final PokemonEvolutionChain pokemonEvolutionChain;

  const PokemonEvolutionChainLoaded(this.pokemonEvolutionChain);

  @override
  List<Object> get props => [pokemonEvolutionChain];
}

class PokemonEvolutionChainFailure extends PokemonEvolutionChainState {
  final String msg;

  const PokemonEvolutionChainFailure(this.msg);

  @override
  List<Object> get props => [msg];
}
