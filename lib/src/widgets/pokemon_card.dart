import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/model/main.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonPaginationResult,
  }) : super(key: key);

  final PokemonPaginationResult pokemonPaginationResult;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: [
            CircleAvatar(
              radius: 65.0,
              backgroundColor: Colors.grey[200],
              child: CachedNetworkImage(
                imageUrl: pokemonPaginationResult.imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.warning),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(
            top: 110.0,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "No. ${pokemonPaginationResult.number}",
                  style: GoogleFonts.teko(
                    height: 0,
                    color: Theme.of(context).textTheme.caption?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${pokemonPaginationResult.name[0].toUpperCase()}${pokemonPaginationResult.name.substring(1)}",
                style: GoogleFonts.teko(
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
