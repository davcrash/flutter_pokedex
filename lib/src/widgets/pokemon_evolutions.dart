import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_evolution_chain/pokemon_evolution_chain_cubit.dart';
import 'package:pokedex/src/model/main.dart';
import 'package:pokedex/src/widgets/pokemon_card.dart';

class PokemonEvolutions extends StatelessWidget {
  const PokemonEvolutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonEvolutionChainCubit, PokemonEvolutionChainState>(
      builder: (context, state) {
        if (state is PokemonEvolutionChainLoaded) {
          final evolutions = _formatEvolutions(
            state.pokemonEvolutionChain,
          );
          if (evolutions.length > 1) {
            return Column(
              children: [
                Text(
                  "Evolutions",
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.textTheme.caption!.color),
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < evolutions.length; i++)
                        SizedBox(
                          width: 150,
                          child: PokemonCard(
                            isFromDetails: true,
                            pokemonPaginationResult: evolutions[i],
                            isClickeable: i != 0,
                          ),
                        )
                    ],
                  ),
                ),
              ],
            );
          }
        }
        return Container();
      },
    );
  }

  List<PokemonPaginationResult> _formatEvolutions(
    PokemonEvolutionChain pokemonEvolutionChain,
  ) {
    final List<PokemonPaginationResult> evolutionList = [];
    evolutionList.add(
      PokemonPaginationResult.fromSpecies(pokemonEvolutionChain.chain.species),
    );
    _addEnvolvesThreeToList(
      evolutionList,
      pokemonEvolutionChain.chain.evolvesTo,
    );
    return evolutionList;
  }

  void _addEnvolvesThreeToList(
    List<PokemonPaginationResult> list,
    List<EvolvesTo> evolvesTo,
  ) {
    for (final evolve in evolvesTo) {
      list.add(PokemonPaginationResult.fromSpecies(evolve.species));
      _addEnvolvesThreeToList(
        list,
        evolve.evolvesTo,
      );
    }
  }
}
