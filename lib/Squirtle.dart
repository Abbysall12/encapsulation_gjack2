// squirtle.dart 
// Squirtle is a DERIVED CLASS inheriting from Trainer. 
// It has its own unique set of water-type skills. 

import 'base_class.dart'; 
import 'skill.dart'; 

class Squirtle extends Trainer { 
  final String _type = "Water";

  Squirtle(int level) 
      : super("Squirtle", level, [ 
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
}