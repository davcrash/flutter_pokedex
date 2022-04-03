import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '../../../model/main.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.type}) : super(key: key);
  final Type type;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeColor = typeColors[type.type!.name];
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 2.5,
      ),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        toBeginningOfSentenceCase(type.type!.name)!,
        style: theme.textTheme.headline5!.copyWith(
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
