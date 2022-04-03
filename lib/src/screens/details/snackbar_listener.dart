import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pokemon_details/pokemon_details_cubit.dart';
import '../../bloc/pokemon_evolution_chain/pokemon_evolution_chain_cubit.dart';
import '../../bloc/pokemon_specie/pokemon_specie_cubit.dart';
import '../../snackbar_error.dart';

class SnackBarListener extends StatelessWidget {
  const SnackBarListener({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PokemonDetailsCubit, PokemonDetailsState>(
          listener: (context, state) {
            if (state is PokemonDetailsFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                getErrorSnackbar(state.msg),
              );
            }
          },
        ),
        BlocListener<PokemonSpecieCubit, PokemonSpecieState>(
          listener: (context, state) {
            if (state is PokemonSpecieFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                getErrorSnackbar(state.msg),
              );
            }
          },
        ),
        BlocListener<PokemonEvolutionChainCubit, PokemonEvolutionChainState>(
          listener: (context, state) {
            if (state is PokemonEvolutionChainFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                getErrorSnackbar(state.msg),
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
