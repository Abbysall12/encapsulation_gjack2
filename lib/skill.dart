// skill.dart
// This file defines the Skill class (a building block).
// It demonstrates ENCAPSULATION by keeping fields private (with _)
// and exposing them only through getters.

class Skill {
  // Private fields (cannot be accessed directly outside this file)
  final String _name;
  final int _attackPower;
  final int _manaCost;

  // Constructor to initialize skill properties
  Skill(this._name, this._attackPower, this._manaCost);

  // Public getters (controlled access to private fields)
  String get name => _name;
  int get attackPower => _attackPower;
  int get manaCost => _manaCost;

  // Method to display skill details
  void displaySkill() {
    print("Skill: $_name | Power: $_attackPower | Mana Cost: $_manaCost");
  }
}