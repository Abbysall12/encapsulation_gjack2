// trainer.dart
// This is the BASE CLASS.
// It represents a "Trainer" with name, level, and skills.
// Other classes (like Pikachu and Charmander) will INHERIT from this.

import 'skill.dart';

import 'testDMG_calc.dart';
import 'testRace_prof.dart';

class Trainer {
  // Private fields (encapsulation)
  final String _name;
  final Race _race;                        // To apply "type/race" to the pokemon
  final double _maxHealth;                 // Self-explanatory, didn't work on this much -CyrusYouFngIdiot
  double _health;
  final int _level;                        // I had the thought of adding a functional leveling system but meh. Too much work.
  final List<Skill> _skills;

  final Map<PhysType, ResisType> _physResistOverrides = {};     // Stores overriden Physical Resistances.
  final Map<ElemType, ResisType> _elemResistOverrides = {};     // Stores overriden Elemenetal Resistances.

  // ^^^ | ex.
  // Dummy.setResistance(PhysType.Slash, ResisType.Fatal);
  // Dummy.setResistance(ElemType.Fire, ResisType.Fatal);
  // Which will then take priority over preset race resistances. Methinks.
  // Probably doesn't work so don't even try this.

  // Unit(this.name, double health, this.race) : _health = health;

  // Constructor to initialize trainer (or pokemon) details
  Trainer(this._name, this._race, this._maxHealth, this._health, this._level, this._skills);

  // ^^^ | So, it should look like
  /*
    Dummy()
      super('Dummy', Race.Dummy, 100, 100, 100, [
        Skill('Skill 1', 10, 5),
        Skill('Skill 2', 20, 10),
        Skill('Skill 3', 40, 15),
        Skill('Skill 4', 70, 20),
      ]);
  */

  // Public getters
  String get name => _name;
  Race get race => _race;
  double get maxHealth => _maxHealth;
  double get health => _health;
  int get level => _level;

  // Method that shows skills of the current object
  void displaySkills() {
    print("$_name's Skills:");
    for (var s in _skills) {
      s.displaySkill(); // Calls display from Skill class
    }
  }

  // Sets custom Resistances/Weaknesses ex. unit.setResistance(PhysType.Slash, ResisType.Weak);
void setResistance(dynamic type, ResisType resistance) {
    if (type is PhysType) {                         // Checks first whether or not it's a Physical Resistance thats being overwritten.
      _physResistOverrides[type] = resistance;      // If true, then overwrite preset Physical Resistance to the new one.
    } else if (type is ElemType) {                  // Similar check for Physical Res., except it's Elemental.
      _elemResistOverrides[type] = resistance;      // If true, overwrite preset Elemental Res. to the new one.
    }
  }

  // Sends a request to get information of the target's Resistances/Weaknesses.
  ResisType getResistance(dynamic type) {
    if (type is PhysType) {                                   // Checks if user is requesting for Physical Type info.
      return _physResistOverrides[type] ?? ResisType.Normal;  // Gives info if true, else if none then default to normal.
    } else if (type is ElemType) {                            // Checks if user is requesting for Elemental Type info.
      return _elemResistOverrides[type] ?? ResisType.Normal;  // Gives info if true, else if none then default to normal.
    } else {                                                        // If absolutely nothing,
      throw ArgumentError("Unsupported resistance type: $type");    // then print this.
    }
  }

  void receiveDamage(DamageAttribute damage) {                  // Self-explanatory title.
    double finalDamage = damage.calculateDamageAgainst(this);   // Damage received is first processed by testDMG_calc.
    _health -= finalDamage;                                     // Apply damage to health.
    if (_health < 0) _health = 0;                               // So that it doesn't display Negative Health.

    if (_health == 0) {
      print("$name has been defeated!");                        // Send death message.
    }
    // print('$_name received $finalDamage damage!'); //Debug
  }

}