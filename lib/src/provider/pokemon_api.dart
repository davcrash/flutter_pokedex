import 'package:http/http.dart' as http;
import 'package:pokedex/src/model/main.dart';

class PokemonApi {
  final _apiURL = "https://pokeapi.co/api/v2";
  final _pokemonEndpoint = "/pokemon";
  final http.Client _httpClient;

  PokemonApi({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  Future<Pagination> getPokemonList({
    int limit = 10,
    int offset = 0,
  }) async {
    final uri = Uri.http(
      _apiURL,
      _pokemonEndpoint,
      {'limit': limit, 'offset': offset},
    );

    final response = await _httpClient.get(uri);
    final pagination = Pagination.fromRawJson(response.body);

    return pagination;
  }
}
