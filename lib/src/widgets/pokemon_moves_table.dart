import 'package:flutter/material.dart';
import 'package:pokedex/src/model/main.dart';

class PokemonMovesTable extends StatelessWidget {
  final List<Move> moves;
  final String tableName;
  const PokemonMovesTable(
      {Key? key, required this.moves, required this.tableName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30.0,
      ),
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            Text(
              tableName,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.textTheme.caption!.color),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    "Name",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: theme.textTheme.caption!.color),
                  ),
                ),
                Text(
                  "Lvl",
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: theme.textTheme.caption!.color),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: moves.length,
              itemBuilder: (context, i) {
                return _MovesTableRow(move: moves[i]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MovesTableRow extends StatelessWidget {
  final Move move;
  const _MovesTableRow({Key? key, required this.move}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(move.move!.name!),
          ),
          Text(move.versionGroupDetails!.first.levelLearnedAt!.toString()),
        ],
      ),
    );
  }
}
