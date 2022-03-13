import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/widgets/pokemon_stats.dart';
import 'package:pokedex/src/widgets/pokemon_type.dart';

import '../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../model/main.dart' as models;

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          //TODO:SKELETON
        }
        if (state is PokemonDetailsLoaded) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Type",
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: theme.textTheme.caption!.color),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var type
                              in state.pokemon.types ?? <models.Type>[])
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: PokemonType(type: type),
                            )
                        ],
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(right: 40)),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${state.pokemon.height}",
                                style: theme.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "height",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: theme.textTheme.caption!.color,
                                  height: .3,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${state.pokemon.weight}",
                                style: theme.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "weight",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: theme.textTheme.caption!.color,
                                  height: .3,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              PokemonStats(
                stats: state.pokemon.stats!,
                type: state.pokemon.types!.first,
              ),
            ],
          );
        }
        return Text("ERROR");
      },
    );
  }
}
