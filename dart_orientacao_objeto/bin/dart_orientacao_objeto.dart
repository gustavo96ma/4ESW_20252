import 'character.dart';
import 'naruto_character.dart';

void main() {
  print('Hello World!');

  /// Tio Patinhas
  Character scroogeMcDuck = Character(
    name: 'Tio Patinhas',
    universe: 'Duck Tales',
    mainSkill: 'Riqueza',
    isProtagonist: true,
    childrenCount: 0,
  );
  print(scroogeMcDuck.log());

  /// Itachi
  NarutoCharacter itachi = NarutoCharacter(
    name: 'Itachi Uchiha',
    universe: 'Naruto',
    mainSkill: 'Mangekyo Sharingan',
    isProtagonist: false,
    childrenCount: 0,
    country: 'País do Fogo',
    village: 'Vila da Folha',
    rank: 'Renegado',
  );
  print(itachi.log());
}
