import 'character.dart';

class NarutoCharacter extends Character {
  /// País da personagem
  String country;

  /// Vila da personagem
  String village;

  /// Patente da personagem. Ex: Genin, Jounin, Chounin
  String rank;

  NarutoCharacter({
    required super.name,
    required super.universe,
    required super.mainSkill,
    required super.isProtagonist,
    required super.childrenCount,
    required this.country,
    required this.village,
    required this.rank,
  });

  @override
  String log() {
    String printResult =
        '''${super.log()}
        country: $country
        village: $village
        rank: $rank
        ''';
    return printResult;
  }
}
