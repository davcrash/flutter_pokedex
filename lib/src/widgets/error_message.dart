import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, this.height = 100}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/failed_pokemon.png'),
          ),
          Text(
            "Something went wrong.\nPlease try again later",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
