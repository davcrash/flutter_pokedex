import 'package:flutter/material.dart';
import 'package:pokedex/src/model/main.dart';

class StatsGraph extends StatefulWidget {
  const StatsGraph({Key? key, required this.stats, required this.type})
      : super(key: key);

  final List<Stat> stats;
  final Type type;

  @override
  State<StatsGraph> createState() => _StatsGraphState();
}

class _StatsGraphState extends State<StatsGraph>
    with SingleTickerProviderStateMixin {
  final barHeight = 150.0;
  final animationDuration = 1000;
  late final _controller = AnimationController(
    duration: Duration(milliseconds: animationDuration),
    vsync: this,
  );

  List<Animation<double>> animations = [];

  @override
  void initState() {
    super.initState();
    final animationDelay = (animationDuration / widget.stats.length) / 1000;
    double currentAnimationDelay = .0;
    for (var i = 0; i < widget.stats.length; i++) {
      final newDelay = animationDelay + currentAnimationDelay;
      final height = (widget.stats[i].baseStat! * 100.0) / barHeight;
      final animation = Tween<double>(
        begin: 0,
        end: height,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            currentAnimationDelay,
            newDelay,
            curve: Curves.ease,
          ),
        ),
      );
      animations.add(animation);
      currentAnimationDelay = newDelay;
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.stats.length; i++)
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
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            height: animations[i].value,
                            decoration: BoxDecoration(
                              color: _getColorByStateIndex(
                                i,
                                theme.primaryColor,
                                typeColors[widget.type.type!.name]!,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          );
                        },
                      ),
                      Text("${widget.stats[i].baseStat}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    "${widget.stats[i].stat!.name}",
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
      return typeColor.withOpacity(.8);
    }
    return typeColor.withOpacity(.5);
  }
}
