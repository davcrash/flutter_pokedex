import 'package:flutter/material.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({Key? key, this.size = 35}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final borderSize = size * .2;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size,
          width: size,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: size - borderSize,
          width: size - borderSize,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: borderSize * .7,
          width: size,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
        Container(
          height: borderSize * 2,
          width: borderSize * 2,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: borderSize,
          width: borderSize,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
