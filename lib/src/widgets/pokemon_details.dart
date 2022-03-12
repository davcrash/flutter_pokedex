import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../model/main.dart' as models;

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoaded) {
          return Column(
            children: [
              if (state.pokemon.types != null)
                for (var type in state.pokemon.types ?? <models.Type>[]) ...[
                  Text(type.type!.name!)
                ]
            ],
          );
        }
        return Text("ERROR");
      },
    );
  }
}
