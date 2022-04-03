import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pokemon_paginate/pokemon_paginate_cubit.dart';
import '../../snackbar_error.dart';

class SnackBarListener extends StatelessWidget {
  const SnackBarListener({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PokemonPaginateCubit, PokemonPaginateState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                getErrorSnackbar(state.errorMessage!),
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
