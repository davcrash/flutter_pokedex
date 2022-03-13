import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    //TODO: responsive padding
    return RepositoryProvider.value(
      value: _pokemonRepository,
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
            disabledColor: const Color(0xFFc7c7c7),
            primarySwatch: Colors.red,
            textTheme: GoogleFonts.tekoTextTheme(
              Theme.of(context).textTheme,
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.teko(),
              toolbarTextStyle: GoogleFonts.teko(),
            )),
        home: const MainScreen(),
      ),
    );
  }
}
