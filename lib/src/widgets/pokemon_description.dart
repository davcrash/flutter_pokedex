import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/bloc/pokemon_specie/pokemon_specie_cubit.dart';
import 'package:pokedex/src/widgets/pokemon_description_skeleton.dart';

class PokemonDescription extends StatelessWidget {
  const PokemonDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PokemonSpecieCubit, PokemonSpecieState>(
      builder: (context, state) {
        if (state is PokemonSpecieLoading) {
          return const PokemonDescriptionSkeleton();
        } else if (state is PokemonSpecieLoaded) {
          //TODO: internationalization
          final texts = state.pokemonSpecie.flavorTextEntries
              .where(
                (text) => text.language.name == "en",
              )
              .toList()
            ..shuffle();

          final flavorTextEntries = texts.first;
          final text = flavorTextEntries.flavorText
              .replaceAll("\n", " ")
              .replaceAll("\f", " ");
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Description",
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.textTheme.caption!.color),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                constraints: BoxConstraints(
                  minWidth: 450,
                  maxWidth: 450,
                  maxHeight: theme.textTheme.titleMedium!.fontSize! * 4,
                  minHeight: theme.textTheme.titleMedium!.fontSize! * 4,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
        return Container(); //TODO
      },
    );
  }
}
