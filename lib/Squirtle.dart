// squirtle.dart 
// Squirtle is a DERIVED CLASS inheriting from Trainer. 
// It has its own unique set of water-type skills. 

// CyrusYouFngIdiot: Modified and added skills.

import 'package:encapsulation2/testDMG_calc.dart';

import 'testRace_prof.dart';

import 'base_class.dart'; 
import 'skill.dart'; 

class Squirtle extends Trainer { 
  final String _type = "Water";

  Squirtle(int level) 
      : super("Squirtle", Race.Water, 180, 180, level, [ 
          Skill("Water Gun", 40, 10), 
          Skill("Tackle", 20, 5), 
          Skill("Hydro Pump", 65, 25), 
        ]); 

  String get type => _type;

  @override 
  void displaySkills() { 
    print("Pokémon: ${super.name} (Lvl ${super.level})"); 
    super.displaySkills(); 
  }

// CyrusYouFngIdiot: Added the actual skill.
  void water_Blicky(Trainer target) {
    print("Squirtle used Water Gun!");
    print("Pew pew pew!");
    final AtkAttr = DamageAttribute(PhysType.Pierce, ElemType.Water, 40);
    target.receiveDamage(AtkAttr);
  }

// CyrusYouFngIdiot: Added the actual skill.
  void Tackle(Trainer target) {
    print("Squirtle used Tackle!");
    print("Oh, that hurts.");
    final AtkAttr = DamageAttribute(PhysType.Blunt, ElemType.Normal, 20);
    target.receiveDamage(AtkAttr);
  }

// CyrusYouFngIdiot: RIP skill.dart BOZO, you will not be missed. :skull: :skull: :skull:
// CyrusYouFngIdiot: Also added the actual skill.
  void hydro_Pump(Trainer target) {
    print("Squirtle used Hydro Pump!");
    print("High Pressure Cadence!");
    final AtkAttr = DamageAttribute(PhysType.Blunt, ElemType.Water, 65);
    target.receiveDamage(AtkAttr);
  }
}