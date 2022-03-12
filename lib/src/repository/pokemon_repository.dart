import 'package:pokedex/src/model/main.dart';
import 'package:pokedex/src/provider/pokemon_api.dart';

class PokemonRepository {
  final PokemonApi _pokemonApi;

  PokemonRepository({PokemonApi? pokemonApi})
      : _pokemonApi = pokemonApi ?? PokemonApi();

  Future<Pagination> getPokemonList({
    int limit = 10,
    int offset = 0,
  }) async {
    return await _pokemonApi.getPokemonList(limit: limit, offset: offset);
  }

  Future<Pokemon> getPokemon(int id) async {
    return await _pokemonApi.getPokemon(id);
  }
}
