// To parse this JSON data, do
//
//     final PokemonModel = PokemonModelFromMap(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.pastTypes,
  });

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<Ability> abilities;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final List<HeldItem> heldItems;
  final String locationAreaEncounters;
  final List<Move> moves;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final List<PastType> pastTypes;

  factory PokemonModel.fromJson(String str) =>
      PokemonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        isDefault: json["is_default"],
        order: json["order"],
        weight: json["weight"],
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromMap(x))),
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromMap(x))),
        heldItems: List<HeldItem>.from(
            json["held_items"].map((x) => HeldItem.fromMap(x))),
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        pastTypes: List<PastType>.from(
            json["past_types"].map((x) => PastType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toMap())),
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x.toMap())),
      };
}

class Ability {
  Ability({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  final bool isHidden;
  final int slot;
  final Species ability;

  factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        ability: Species.fromMap(json["ability"]),
      );

  Map<String, dynamic> toMap() => {
        "is_hidden": isHidden,
        "slot": slot,
        "ability": ability.toMap(),
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final Species version;

  factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version.toMap(),
      };
}

class HeldItem {
  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  final Species item;
  final List<VersionDetail> versionDetails;

  factory HeldItem.fromJson(String str) => HeldItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HeldItem.fromMap(Map<String, dynamic> json) => HeldItem(
        item: Species.fromMap(json["item"]),
        versionDetails: List<VersionDetail>.from(
            json["version_details"].map((x) => VersionDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "item": item.toMap(),
        "version_details":
            List<dynamic>.from(versionDetails.map((x) => x.toMap())),
      };
}

class VersionDetail {
  VersionDetail({
    required this.rarity,
    required this.version,
  });

  final int rarity;
  final Species version;

  factory VersionDetail.fromJson(String str) =>
      VersionDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VersionDetail.fromMap(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "rarity": rarity,
        "version": version.toMap(),
      };
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "move": move.toMap(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });

  final int levelLearnedAt;
  final Species versionGroup;
  final Species moveLearnMethod;

  factory VersionGroupDetail.fromJson(String str) =>
      VersionGroupDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VersionGroupDetail.fromMap(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        versionGroup: Species.fromMap(json["version_group"]),
        moveLearnMethod: Species.fromMap(json["move_learn_method"]),
      );

  Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "version_group": versionGroup.toMap(),
        "move_learn_method": moveLearnMethod.toMap(),
      };
}

class PastType {
  PastType({
    required this.generation,
    required this.types,
  });

  final Species generation;
  final List<Type> types;

  factory PastType.fromJson(String str) => PastType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PastType.fromMap(Map<String, dynamic> json) => PastType(
        generation: Species.fromMap(json["generation"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "generation": generation.toMap(),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Species type;

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
      };
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  final Sprites blackWhite;

  factory GenerationV.fromJson(String str) =>
      GenerationV.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromMap(json["black-white"]),
      );

  Map<String, dynamic> toMap() => {
        "black-white": blackWhite.toMap(),
      };
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  factory GenerationIv.fromJson(String str) =>
      GenerationIv.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum: Sprites.fromMap(json["platinum"]),
      );

  Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver.toMap(),
        "platinum": platinum.toMap(),
      };
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, Home> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  factory Versions.fromJson(String str) => Versions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromMap(json["generation-i"]),
        generationIi: GenerationIi.fromMap(json["generation-ii"]),
        generationIii: GenerationIii.fromMap(json["generation-iii"]),
        generationIv: GenerationIv.fromMap(json["generation-iv"]),
        generationV: GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: GenerationVii.fromMap(json["generation-vii"]),
        generationViii: GenerationViii.fromMap(json["generation-viii"]),
      );

  Map<String, dynamic> toMap() => {
        "generation-i": generationI.toMap(),
        "generation-ii": generationIi.toMap(),
        "generation-iii": generationIii.toMap(),
        "generation-iv": generationIv.toMap(),
        "generation-v": generationV.toMap(),
        "generation-vi": Map.from(generationVi)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii.toMap(),
        "generation-viii": generationViii.toMap(),
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    // required this.other,
    // required this.versions,
    // required this.animated,
  });

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  // final Other other;
  // final Versions versions;
  // final Sprites animated;

  factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        // other: json["other"] == null ? null : Other.fromMap(json["other"]),
        // versions: json["versions"] == null ? null : Versions.fromMap(json["versions"]),
        // animated: json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        // "other": other == null ? null : other.toMap(),
        // "versions": versions == null ? null : versions.toMap(),
        // "animated": animated == null ? null : animated.toMap(),
      };
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlue redBlue;
  final RedBlue yellow;

  factory GenerationI.fromJson(String str) =>
      GenerationI.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromMap(json["red-blue"]),
        yellow: RedBlue.fromMap(json["yellow"]),
      );

  Map<String, dynamic> toMap() => {
        "red-blue": redBlue.toMap(),
        "yellow": yellow.toMap(),
      };
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.frontDefault,
    required this.frontGray,
  });

  final String backDefault;
  final String backGray;
  final String frontDefault;
  final String frontGray;

  factory RedBlue.fromJson(String str) => RedBlue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "front_default": frontDefault,
        "front_gray": frontGray,
      };
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final Crystal crystal;
  final Crystal gold;
  final Crystal silver;

  factory GenerationIi.fromJson(String str) =>
      GenerationIi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromMap(json["crystal"]),
        gold: Crystal.fromMap(json["gold"]),
        silver: Crystal.fromMap(json["silver"]),
      );

  Map<String, dynamic> toMap() => {
        "crystal": crystal.toMap(),
        "gold": gold.toMap(),
        "silver": silver.toMap(),
      };
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });

  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;

  factory Crystal.fromJson(String str) => Crystal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final Emerald emerald;
  final Crystal fireredLeafgreen;
  final Crystal rubySapphire;

  factory GenerationIii.fromJson(String str) =>
      GenerationIii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromMap(json["emerald"]),
        fireredLeafgreen: Crystal.fromMap(json["firered-leafgreen"]),
        rubySapphire: Crystal.fromMap(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toMap() => {
        "emerald": emerald.toMap(),
        "firered-leafgreen": fireredLeafgreen.toMap(),
        "ruby-sapphire": rubySapphire.toMap(),
      };
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  factory Emerald.fromJson(String str) => Emerald.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  factory Home.fromJson(String str) => Home.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld icons;
  final Home ultraSunUltraMoon;

  factory GenerationVii.fromJson(String str) =>
      GenerationVii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: Home.fromMap(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toMap(),
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;

  factory DreamWorld.fromJson(String str) =>
      DreamWorld.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld icons;

  factory GenerationViii.fromJson(String str) =>
      GenerationViii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromMap(json["icons"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
      };
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        home: Home.fromMap(json["home"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
      );

  Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld.toMap(),
        "home": home.toMap(),
        "official-artwork": officialArtwork.toMap(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  final String frontDefault;

  factory OfficialArtwork.fromJson(String str) =>
      OfficialArtwork.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toMap(),
      };
}
