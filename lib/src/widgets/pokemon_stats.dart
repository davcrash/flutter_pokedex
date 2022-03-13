import 'package:flutter/material.dart';
import 'package:pokedex/src/model/main.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key? key, required this.stats, required this.type})
      : super(key: key);

  final List<Stat> stats;
  final Type type;
  final barHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < stats.length; i++)
          Container(
            constraints: const BoxConstraints(
              maxWidth: 50,
            ),
            width: 50,
            child: Column(
              children: [
                SizedBox(
                  height: barHeight,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: (stats[i].baseStat! * 100.0) / barHeight,
                        decoration: BoxDecoration(
                          color: _getColorByStateIndex(i, theme.primaryColor,
                              typeColors[type.type!.name]!),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                      ),
                      Text("${stats[i].baseStat}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    "${stats[i].stat!.name}",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.textTheme.caption!.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }

  Color _getColorByStateIndex(int i, Color mainColor, Color typeColor) {
    if (i == 0) return mainColor;
    if (i.isOdd) {
      return typeColor;
    }
    return typeColor.withOpacity(.6);
  }
}
