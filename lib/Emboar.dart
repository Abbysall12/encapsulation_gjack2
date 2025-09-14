import 'base_class.dart';
import 'testRace_prof.dart';
import 'testDMG_calc.dart';
import 'skill.dart';

class Emboar extends Trainer {
  // Private fields specific to Mewtwo
  final List<String> _weaknesses;
  final String _type;

  // Constructor
  Emboar()
    : _weaknesses = ['Blunt','Water'],
      _type = 'Fighter',
      super('Emboar', Race.Fighter, 210, 210, 55, [
        Skill('Flamethrower', 80, 10),
        Skill('Earthquake', 75, 15),
      ]);

  // Getters for Emboar-specific properties
  List<String> get weaknesses => _weaknesses;
  String get type => _type;

  // Override displaySkills to show more Emboar-specific information
  @override
  void displaySkills() {
    print('\nEmboar Information:');
    print('Race: $_type');
    print('Level: ${super.level}');
    print('Weaknesses: ${_weaknesses.join(", ")}');
    print('\nEmboar\'s Skills:');
    super.displaySkills();
  }

//
  void Flamethrower(Trainer target) {
    print('Emboar uses Flamethrower to harm $target!');
    print('Scorched earth.');
    final atkAttr = DamageAttribute(PhysType.Blunt, ElemType.Fire, 80);
    target.receiveDamage(atkAttr);
  }

  //
  void Earthquake(Trainer target) {
    print('Emboar uses Earthquake!');
    print('$target is struck by the conjured power!');
    final atkAttr = DamageAttribute(PhysType.Blunt, ElemType.Earth, 75);
    target.receiveDamage(atkAttr);
  }
}

