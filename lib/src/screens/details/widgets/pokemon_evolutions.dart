import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_evolution_chain/pokemon_evolution_chain_cubit.dart';
import 'package:pokedex/src/model/main.dart';
import 'package:pokedex/src/responsive/responsive_layout.dart';
import 'package:pokedex/src/screens/details/widgets/pokemon_evolutions_skeleton.dart';
import 'package:pokedex/src/widgets/pokemon_card.dart';

class PokemonEvolutions extends StatelessWidget {
  const PokemonEvolutions({Key? key, required this.pokemonId})
      : super(key: key);
  final String pokemonId;
  final cardHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonEvolutionChainCubit, PokemonEvolutionChainState>(
      builder: (context, state) {
        if (state is PokemonEvolutionChainLoading) {
          return const PokemonEvolutionsSkeleton();
        } else if (state is PokemonEvolutionChainLoaded) {
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
                ResponsiveLayout(
                  desktopBody: Wrap(
                    alignment: WrapAlignment.center,
                    children: _getPokemonCardList(evolutions),
                  ),
                  mobileBody: SizedBox(
                    height: cardHeight,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      children: _getPokemonCardList(evolutions),
                    ),
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

  List<Widget> _getPokemonCardList(List<PokemonPaginationResult> evolutions) {
    return evolutions
        .map(
          (evolution) => SizedBox(
            width: 150,
            height: cardHeight,
            child: PokemonCard(
              isFromDetails: true,
              pokemonPaginationResult: evolution,
              isClickeable: evolution.number != pokemonId,
            ),
          ),
        )
        .toList();
  }
}
