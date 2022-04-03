import 'dart:convert';

import 'package:flutter/material.dart';

final typeColors = {
  'normal': Colors.grey,
  'fire': Colors.red[600],
  'water': Colors.blue,
  'electric': Colors.yellow[700],
  'grass': Colors.green,
  'ice': Colors.blue[200],
  'fighting': Colors.brown[200],
  'poison': Colors.purple,
  'ground': Colors.yellow[800],
  'flying': Colors.teal,
  'psychic': Colors.pink[200],
  'bug': Colors.green[400],
  'rock': Colors.grey[700],
  'ghost': Colors.indigo,
  'dragon': Colors.indigo[400],
  'dark': Colors.blueGrey[800],
  'steel': Colors.blueGrey[600],
  'fairy': Colors.pink[100],
};

class Pagination {
  Pagination({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String? next;
  dynamic previous;
  List<PokemonPaginationResult> results;

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonPaginationResult>.from(
          json["results"].map(
            (x) => PokemonPaginationResult.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PokemonPaginationResult {
  PokemonPaginationResult({
    required this.name,
    required this.number,
    required this.url,
    required this.imageUrl,
  });

  String name;
  String number;
  String url;
  String imageUrl;

  factory PokemonPaginationResult.fromRawJson(String str) =>
      PokemonPaginationResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonPaginationResult.fromSpecies(Species species) {
    return PokemonPaginationResult.fromJson(species.toJson());
  }

  factory PokemonPaginationResult.fromJson(Map<String, dynamic> json) {
    final String url = json["url"];
    final splitUrl = url.split("/");
    final pokemonNumber = splitUrl[splitUrl.length - 2];
    final pokemonNumberWithZeros = "000$pokemonNumber";
    final realPokemonNumber = pokemonNumber.length >= 5
        ? pokemonNumber
        : pokemonNumberWithZeros.substring(
            pokemonNumberWithZeros.length - 3, pokemonNumberWithZeros.length);

    /* 
    final pokemonDefaultImage =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$pokemonNumberWithZeros.png'; 
    */

    final pokemonImage =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${splitUrl[splitUrl.length - 2]}.png";

    return PokemonPaginationResult(
      name: json["name"],
      number: realPokemonNumber,
      url: url,
      imageUrl: pokemonImage,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "imageUrl": imageUrl,
      };
}

class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<NameAndUrl>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  NameAndUrl? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: List<NameAndUrl>.from(
            json["forms"].map((x) => NameAndUrl.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: NameAndUrl.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms!.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems!.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species!.toJson(),
        "sprites": sprites!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  NameAndUrl? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromRawJson(String str) => Ability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: NameAndUrl.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability!.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class NameAndUrl {
  NameAndUrl({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory NameAndUrl.fromRawJson(String str) =>
      NameAndUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameAndUrl.fromJson(Map<String, dynamic> json) => NameAndUrl(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int? gameIndex;
  NameAndUrl? version;

  factory GameIndex.fromRawJson(String str) =>
      GameIndex.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: NameAndUrl.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version!.toJson(),
      };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  NameAndUrl? move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory Move.fromRawJson(String str) => Move.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: NameAndUrl.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move!.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails!.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  NameAndUrl? moveLearnMethod;
  NameAndUrl? versionGroup;

  factory VersionGroupDetail.fromRawJson(String str) =>
      VersionGroupDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: NameAndUrl.fromJson(json["move_learn_method"]),
        versionGroup: NameAndUrl.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod!.toJson(),
        "version_group": versionGroup!.toJson(),
      };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  factory GenerationV.fromRawJson(String str) =>
      GenerationV.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite!.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  factory GenerationIv.fromRawJson(String str) =>
      GenerationIv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl!.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver!.toJson(),
        "platinum": platinum!.toJson(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  factory Versions.fromRawJson(String str) =>
      Versions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI!.toJson(),
        "generation-ii": generationIi!.toJson(),
        "generation-iii": generationIii!.toJson(),
        "generation-iv": generationIv!.toJson(),
        "generation-v": generationV!.toJson(),
        "generation-vii": generationVii!.toJson(),
        "generation-viii": generationViii!.toJson(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other,
        "versions": versions,
        "animated": animated,
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  factory GenerationI.fromRawJson(String str) =>
      GenerationI.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue!.toJson(),
        "yellow": yellow!.toJson(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  factory RedBlue.fromRawJson(String str) => RedBlue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  factory GenerationIi.fromRawJson(String str) =>
      GenerationIi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal!.toJson(),
        "gold": gold!.toJson(),
        "silver": silver!.toJson(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  factory Crystal.fromRawJson(String str) => Crystal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  factory Gold.fromRawJson(String str) => Gold.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  Emerald? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  factory GenerationIii.fromRawJson(String str) =>
      GenerationIii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald!.toJson(),
        "firered-leafgreen": fireredLeafgreen!.toJson(),
        "ruby-sapphire": rubySapphire!.toJson(),
      };
}

class Emerald {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory Emerald.fromRawJson(String str) => Emerald.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  factory GenerationVii.fromRawJson(String str) =>
      GenerationVii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons!.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon!.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromRawJson(String str) =>
      DreamWorld.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  factory GenerationViii.fromRawJson(String str) =>
      GenerationViii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons!.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld!.toJson(),
        "home": home!.toJson(),
        "official-artwork": officialArtwork!.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  String? frontDefault;

  factory OfficialArtwork.fromRawJson(String str) =>
      OfficialArtwork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  NameAndUrl? stat;

  factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: NameAndUrl.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  NameAndUrl? type;

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: NameAndUrl.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}

class PokemonSpecie {
  PokemonSpecie({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });
  late final int baseHappiness;
  late final int captureRate;
  late final PokemonColor color;
  late final List<EggGroups> eggGroups;
  late final EvolutionChain evolutionChain;
  late final EvolvesFromSpecies? evolvesFromSpecies;
  late final List<FlavorTextEntries> flavorTextEntries;
  late final List<dynamic> formDescriptions;
  late final bool formsSwitchable;
  late final int genderRate;
  late final List<Genera> genera;
  late final Generation generation;
  late final GrowthRate growthRate;
  late final Habitat? habitat;
  late final bool hasGenderDifferences;
  late final int hatchCounter;
  late final int id;
  late final bool isBaby;
  late final bool isLegendary;
  late final bool isMythical;
  late final String name;
  late final List<Names> names;
  late final int order;
  late final List<PalParkEncounters> palParkEncounters;
  late final List<PokedexNumbers> pokedexNumbers;
  late final Shape shape;
  late final List<Varieties> varieties;

  factory PokemonSpecie.fromRawJson(String str) =>
      PokemonSpecie.fromJson(json.decode(str));

  PokemonSpecie.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = PokemonColor.fromJson(json['color']);
    eggGroups = List.from(json['egg_groups'])
        .map((e) => EggGroups.fromJson(e))
        .toList();
    evolutionChain = EvolutionChain.fromJson(json['evolution_chain']);
    evolvesFromSpecies = json['evolves_from_species'] != null
        ? EvolvesFromSpecies.fromJson(json['evolves_from_species'])
        : null;
    flavorTextEntries = List.from(json['flavor_text_entries'])
        .map((e) => FlavorTextEntries.fromJson(e))
        .toList();
    formDescriptions =
        List.castFrom<dynamic, dynamic>(json['form_descriptions']);
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    genera = List.from(json['genera']).map((e) => Genera.fromJson(e)).toList();
    generation = Generation.fromJson(json['generation']);
    growthRate = GrowthRate.fromJson(json['growth_rate']);
    habitat =
        json['habitat'] != null ? Habitat.fromJson(json['habitat']) : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    names = List.from(json['names']).map((e) => Names.fromJson(e)).toList();
    order = json['order'];
    palParkEncounters = List.from(json['pal_park_encounters'])
        .map((e) => PalParkEncounters.fromJson(e))
        .toList();
    pokedexNumbers = List.from(json['pokedex_numbers'])
        .map((e) => PokedexNumbers.fromJson(e))
        .toList();
    shape = Shape.fromJson(json['shape']);
    varieties =
        List.from(json['varieties']).map((e) => Varieties.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_happiness'] = baseHappiness;
    _data['capture_rate'] = captureRate;
    _data['color'] = color.toJson();
    _data['egg_groups'] = eggGroups.map((e) => e.toJson()).toList();
    _data['evolution_chain'] = evolutionChain.toJson();
    _data['evolves_from_species'] = evolvesFromSpecies;
    _data['flavor_text_entries'] =
        flavorTextEntries.map((e) => e.toJson()).toList();
    _data['form_descriptions'] = formDescriptions;
    _data['forms_switchable'] = formsSwitchable;
    _data['gender_rate'] = genderRate;
    _data['genera'] = genera.map((e) => e.toJson()).toList();
    _data['generation'] = generation.toJson();
    _data['growth_rate'] = growthRate.toJson();
    _data['habitat'] = habitat != null ? habitat!.toJson() : null;
    _data['has_gender_differences'] = hasGenderDifferences;
    _data['hatch_counter'] = hatchCounter;
    _data['id'] = id;
    _data['is_baby'] = isBaby;
    _data['is_legendary'] = isLegendary;
    _data['is_mythical'] = isMythical;
    _data['name'] = name;
    _data['names'] = names.map((e) => e.toJson()).toList();
    _data['order'] = order;
    _data['pal_park_encounters'] =
        palParkEncounters.map((e) => e.toJson()).toList();
    _data['pokedex_numbers'] = pokedexNumbers.map((e) => e.toJson()).toList();
    _data['shape'] = shape.toJson();
    _data['varieties'] = varieties.map((e) => e.toJson()).toList();
    return _data;
  }
}

class EvolvesFromSpecies {
  EvolvesFromSpecies({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  EvolvesFromSpecies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class PokemonColor {
  PokemonColor({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  PokemonColor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class EggGroups {
  EggGroups({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  EggGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });
  late final String url;

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}

class FlavorTextEntries {
  FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });
  late final String flavorText;
  late final Language language;
  late final Version version;

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = Language.fromJson(json['language']);
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flavor_text'] = flavorText;
    _data['language'] = language.toJson();
    _data['version'] = version.toJson();
    return _data;
  }
}

class Language {
  Language({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Genera {
  Genera({
    required this.genus,
    required this.language,
  });
  late final String genus;
  late final Language language;

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language = Language.fromJson(json['language']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genus'] = genus;
    _data['language'] = language.toJson();
    return _data;
  }
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Generation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class GrowthRate {
  GrowthRate({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  GrowthRate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Habitat {
  Habitat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Habitat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Names {
  Names({
    required this.language,
    required this.name,
  });
  late final Language language;
  late final String name;

  Names.fromJson(Map<String, dynamic> json) {
    language = Language.fromJson(json['language']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['language'] = language.toJson();
    _data['name'] = name;
    return _data;
  }
}

class PalParkEncounters {
  PalParkEncounters({
    required this.area,
    required this.baseScore,
    required this.rate,
  });
  late final Area area;
  late final int baseScore;
  late final int rate;

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = Area.fromJson(json['area']);
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['area'] = area.toJson();
    _data['base_score'] = baseScore;
    _data['rate'] = rate;
    return _data;
  }
}

class Area {
  Area({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Area.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class PokedexNumbers {
  PokedexNumbers({
    required this.entryNumber,
    required this.pokedex,
  });
  late final int entryNumber;
  late final Pokedex pokedex;

  PokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokedex = Pokedex.fromJson(json['pokedex']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['entry_number'] = entryNumber;
    _data['pokedex'] = pokedex.toJson();
    return _data;
  }
}

class Pokedex {
  Pokedex({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Pokedex.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Shape {
  Shape({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Shape.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Varieties {
  Varieties({
    required this.isDefault,
    required this.pokemon,
  });
  late final bool isDefault;
  late final PokemonData pokemon;

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon = PokemonData.fromJson(json['pokemon']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_default'] = isDefault;
    _data['pokemon'] = pokemon.toJson();
    return _data;
  }
}

class PokemonData {
  PokemonData({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  PokemonData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class PokemonEvolutionChain {
  PokemonEvolutionChain({
    this.babyTriggerItem,
    required this.chain,
    required this.id,
  });
  late final dynamic babyTriggerItem;
  late final Chain chain;
  late final int id;

  factory PokemonEvolutionChain.fromRawJson(String str) =>
      PokemonEvolutionChain.fromJson(json.decode(str));

  PokemonEvolutionChain.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = null;
    chain = Chain.fromJson(json['chain']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['baby_trigger_item'] = babyTriggerItem;
    _data['chain'] = chain.toJson();
    _data['id'] = id;
    return _data;
  }
}

class Chain {
  Chain({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });
  late final List<dynamic> evolutionDetails;
  late final List<EvolvesTo> evolvesTo;
  late final bool isBaby;
  late final Species species;

  Chain.fromJson(Map<String, dynamic> json) {
    evolutionDetails =
        List.castFrom<dynamic, dynamic>(json['evolution_details']);
    evolvesTo = List.from(json['evolves_to'])
        .map((e) => EvolvesTo.fromJson(e))
        .toList();
    isBaby = json['is_baby'];
    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['evolution_details'] = evolutionDetails;
    _data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    _data['is_baby'] = isBaby;
    _data['species'] = species.toJson();
    return _data;
  }
}

class EvolvesTo {
  EvolvesTo({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });
  late final List<EvolutionDetails> evolutionDetails;
  late final List<EvolvesTo> evolvesTo;
  late final bool isBaby;
  late final Species species;

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    evolutionDetails = List.from(json['evolution_details'])
        .map((e) => EvolutionDetails.fromJson(e))
        .toList();
    evolvesTo = List.from(json['evolves_to'])
        .map((e) => EvolvesTo.fromJson(e))
        .toList();
    isBaby = json['is_baby'];
    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['evolution_details'] =
        evolutionDetails.map((e) => e.toJson()).toList();
    _data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    _data['is_baby'] = isBaby;
    _data['species'] = species.toJson();
    return _data;
  }
}

class EvolutionDetails {
  EvolutionDetails({
    this.gender,
    this.heldItem,
    this.item,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minAffection,
    this.minBeauty,
    this.minHappiness,
    required this.minLevel,
    required this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    required this.timeOfDay,
    this.tradeSpecies,
    required this.trigger,
    required this.turnUpsideDown,
  });
  late final dynamic gender;
  late final dynamic heldItem;
  late final dynamic item;
  late final dynamic knownMove;
  late final dynamic knownMoveType;
  late final dynamic location;
  late final dynamic minAffection;
  late final dynamic minBeauty;
  late final dynamic minHappiness;
  late final dynamic minLevel;
  late final dynamic needsOverworldRain;
  late final dynamic partySpecies;
  late final dynamic partyType;
  late final dynamic relativePhysicalStats;
  late final String timeOfDay;
  late final dynamic tradeSpecies;
  late final Trigger trigger;
  late final bool turnUpsideDown;

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    gender = null;
    heldItem = null;
    item = null;
    knownMove = null;
    knownMoveType = null;
    location = null;
    minAffection = null;
    minBeauty = null;
    minHappiness = null;
    minLevel = null;
    needsOverworldRain = null;
    partySpecies = null;
    partyType = null;
    relativePhysicalStats = null;
    timeOfDay = json['time_of_day'];
    tradeSpecies = null;
    trigger = Trigger.fromJson(json['trigger']);
    turnUpsideDown = json['turn_upside_down'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gender'] = gender;
    _data['held_item'] = heldItem;
    _data['item'] = item;
    _data['known_move'] = knownMove;
    _data['known_move_type'] = knownMoveType;
    _data['location'] = location;
    _data['min_affection'] = minAffection;
    _data['min_beauty'] = minBeauty;
    _data['min_happiness'] = minHappiness;
    _data['min_level'] = minLevel;
    _data['needs_overworld_rain'] = needsOverworldRain;
    _data['party_species'] = partySpecies;
    _data['party_type'] = partyType;
    _data['relative_physical_stats'] = relativePhysicalStats;
    _data['time_of_day'] = timeOfDay;
    _data['trade_species'] = tradeSpecies;
    _data['trigger'] = trigger.toJson();
    _data['turn_upside_down'] = turnUpsideDown;
    return _data;
  }
}

class Trigger {
  Trigger({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
