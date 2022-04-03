import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/screens/details/widgets/pokemon_type.dart';
import 'package:pokedex/src/widgets/skeleton_shape.dart';

import '../../../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../../../model/main.dart' as models;

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoaded || state is PokemonDetailsLoading) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Type",
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.textTheme.caption!.color),
                  ),
                  (state is PokemonDetailsLoaded)
                      ? Row(
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
                        )
                      : const SkeletonShape(
                          height: 40,
                          width: 80,
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
                          (state is PokemonDetailsLoaded)
                              ? Text(
                                  "${state.pokemon.height}",
                                  style: theme.textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Column(
                                  children: [
                                    SkeletonShape(
                                      height:
                                          theme.textTheme.headline5!.fontSize,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
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
                          (state is PokemonDetailsLoaded)
                              ? Text(
                                  "${state.pokemon.weight}",
                                  style: theme.textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Column(
                                  children: [
                                    SkeletonShape(
                                      height:
                                          theme.textTheme.headline5!.fontSize,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
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
          );
        }
        return Container(); //TODO
      },
    );
  }
}
