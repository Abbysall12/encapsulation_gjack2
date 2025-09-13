// trainer.dart
// This is the BASE CLASS.
// It represents a "Trainer" with name, level, and skills.
// Other classes (like Pikachu and Charmander) will INHERIT from this.

import 'skill.dart';

class Trainer {
  // Private fields (encapsulation)
  final String _name;
  final int _level;
  final List<Skill> _skills;

  // Constructor to initialize trainer (or pokemon) details
  Trainer(this._name, this._level, this._skills);

  // Public getters
  String get name => _name;
  int get level => _level;

  // Method that shows skills of the current object
  void displaySkills() {
    print("$_name's Skills:");
    for (var s in _skills) {
      s.displaySkill(); // Calls display from Skill class
    }
  }
}