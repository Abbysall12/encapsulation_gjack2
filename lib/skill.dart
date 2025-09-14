// skill.dart
// This file defines the Skill class (a building block).
// It demonstrates ENCAPSULATION by keeping fields private (with _)
// and exposing them only through getters.

// CyrusYouFngIdiot: I am aware this page is getting very little attention.          11:37 PM | 9/13/2025
// CyrusYouFngIdiot: And the fact that it's probably ignored or improperly used.     11:38 PM | -/--/----
// CyrusYouFngIdiot: Whatever, not my problem. I'm too tired.                        11:28 PM | -/--/----

// CyrusYouFngIdiot: That _staminacost, in essence, does nothing.                    11:44 PM | -/--/----
// CyrusYouFngIdiot: No, I'm not making a functional one.                            11:-- PM | -/--/----

class Skill {
  // Private fields (cannot be accessed directly outside this file)
  final String _name;
  final int _attackPower;
  final int _staminaCost;

  // Constructor to initialize skill properties
  Skill(this._name, this._attackPower, this._staminaCost);

  // Public getters (controlled access to private fields)
  String get name => _name;
  int get attackPower => _attackPower;
  int get manaCost => _staminaCost;

  // Method to display skill details
  void displaySkill() {
    print("Skill: $_name | Power: $_attackPower | Mana Cost: $_staminaCost");
  }
}