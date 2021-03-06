import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/model/main.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '../screens/details/pokemon_details.screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonPaginationResult,
    this.isFromDetails = false,
    this.isClickeable = true,
  }) : super(key: key);

  final PokemonPaginationResult pokemonPaginationResult;
  final bool isFromDetails;
  final bool isClickeable;

  @override
  Widget build(BuildContext context) {
    final heroTag = isFromDetails
        ? "${pokemonPaginationResult.number}_details"
        : pokemonPaginationResult.number;
    return MouseRegion(
      cursor: isClickeable ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: () {
          if (!isClickeable) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PokemonDetailsScreen(
                  pokemonPaginationResult: pokemonPaginationResult,
                );
              },
            ),
          );
        },
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: heroTag,
                  child: Transform.scale(
                    scale: 1.2,
                    child: CachedNetworkImage(
                      imageUrl: pokemonPaginationResult.imageUrl,
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage('assets/failed_pokemon.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "No. ${pokemonPaginationResult.number}",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            height: 0,
                            color: Theme.of(context).textTheme.caption?.color,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${toBeginningOfSentenceCase(pokemonPaginationResult.name)}",
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
