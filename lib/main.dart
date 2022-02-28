import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/repository/pokemon_repository.dart';
import 'package:pokedex/src/screens/main.screen.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final pokemonRepository = PokemonRepository();
      runApp(MyApp(pokemonRepository: pokemonRepository));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(key: key);

  final PokemonRepository _pokemonRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _pokemonRepository,
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
