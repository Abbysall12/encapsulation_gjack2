import 'base_class.dart';
import 'testRace_prof.dart';
import 'testDMG_calc.dart';
import 'skill.dart';

// CyrusYouFngIdiot: Modified and added skills.

class Mewtwo extends Trainer {
  // Private fields specific to Mewtwo
  final List<String> _weaknesses;
  final String _type;

  // Constructor
  Mewtwo()
    : _weaknesses = ['Dark', 'Ghost', 'Bug'],
      _type = 'Psychic',
      super('Mewtwo', Race.Psychic, 170, 80, 70, [
        Skill('Psychic', 90, 10),
        Skill('Shadow Ball', 80, 15),
        Skill('Recover', 40, 20),
        Skill('Psystrike', 120, 25),
      ]);

  // Getters for Mewtwo-specific properties
  List<String> get weaknesses => _weaknesses;
  String get type => _type;

  // Actually applies the Pokemon-exclusive weaknesses.

  // Override displaySkills to show more Mewtwo-specific information
  @override
  void displaySkills() {
    print('\nMewtwo Information:');
    print('Race: $_type');
    print('Level: ${super.level}');
    print('Weaknesses: ${_weaknesses.join(", ")}');
    print('\nMewtwo\'s Skills:');
    super.displaySkills();
  }

  // CyrusYouFngIdiot: Added the actual skill.
  void Psychic(Trainer target) {
    print('Mewtwo uses Psychic to harm $target!');
    print('An annoying migraine spreads throughout their mind!');
    final atkAttr = DamageAttribute(PhysType.Pierce, ElemType.Psychic, 90);
    target.receiveDamage(atkAttr);
  }

  // CyrusYouFngIdiot: Added the actual skill.
  void shadow_Ball(Trainer target) {
    print('Mewtwo uses Shadow Ball!');
    print('$target is struck by the conjured power!');
    final atkAttr = DamageAttribute(PhysType.Blunt, ElemType.Dark, 80);
    target.receiveDamage(atkAttr);
  }

  // CyrusYouFngIdiot: Deal negative damage to self so you heal. Lmao. Or idk, heal the opposing team?
  void Recover(Trainer target) {
    if (target is Mewtwo) {
      print('Mewtwo used Recover on itself! Healing 40 health points back!');
      print('A refreshing feeling momentarily bathes Mewtwo.');
      final atkAttr = DamageAttribute(PhysType.Flat, ElemType.Flat, -40);
      target.receiveDamage(atkAttr);
    } else {
    print('Mewtwo recovers $target!');
    print('How kind of them. :D');
    final atkAttr = DamageAttribute(PhysType.Flat, ElemType.Flat, -40);
    target.receiveDamage(atkAttr);
    }
  }

/*
  void Healing(double amount) {
  if (amount <= 0) {
    print('Full HP or value not assigned.');
    return;
  }

  final Healings = health;
  health += amount;

  if (health > maxHealth) {
    health = maxHealth;
  }
}
*/

  // Special method for Mewtwo's signature move

  // CyrusYouFngIdiot: Bro, i have no idea what you mean by this,-
  // -SO i just treated it like a skill. Also added it on the skills list.

  void Psystrike(Trainer target) {
    print('Mewtwo unleashes its signature move: Psystrike!');
    print('A powerful psychic blast that deals massive damage!');
    final atkAttr = DamageAttribute(PhysType.Blunt, ElemType.Psychic, 120);
    target.receiveDamage(atkAttr);
    // target.receiveDamage(DamageAttribute(PhysType.Slash, ElemType.Fire, 30));
  }
}
