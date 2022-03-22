import 'package:http/http.dart' as http;
import 'package:pokedex/src/model/main.dart';

class PokemonApi {
  final _apiURL = "pokeapi.co";
  final _pokemonEndpoint = "/api/v2/pokemon";
  final _pokemonSpecieEndpoint = "/api/v2/pokemon-species";
  final _pokemonEvolutionChainEndpoint = "/api/v2/evolution-chain";
  final http.Client _httpClient;

  PokemonApi({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  Future<Pagination> getPokemonList({
    int limit = 10,
    int offset = 0,
  }) async {
    final uri = Uri.https(
      _apiURL,
      _pokemonEndpoint,
      {'limit': limit.toString(), 'offset': offset.toString()},
    );

    final response = await _httpClient.get(uri);
    final pagination = Pagination.fromRawJson(response.body);

    return pagination;
  }

  Future<Pokemon> getPokemon(int id) async {
    final uri = Uri.https(_apiURL, "$_pokemonEndpoint/$id");
    final response = await _httpClient.get(uri);
    final pokemon = Pokemon.fromRawJson(response.body);
    return pokemon;
  }

  Future<PokemonSpecie> getPokemonSpecie(int id) async {
    final uri = Uri.https(_apiURL, "$_pokemonSpecieEndpoint/$id");
    final response = await _httpClient.get(uri);
    final specie = PokemonSpecie.fromRawJson(response.body);
    return specie;
  }

  Future<PokemonEvolutionChain> getPokemonEvolutionChain(int id) async {
    final uri = Uri.https(_apiURL, "$_pokemonEvolutionChainEndpoint/$id");
    final response = await _httpClient.get(uri);
    final evolution = PokemonEvolutionChain.fromRawJson(response.body);
    return evolution;
  }
}
