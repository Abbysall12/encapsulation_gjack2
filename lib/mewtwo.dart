import 'base_class.dart';
import 'skill.dart';

class Mewtwo extends Trainer {
  // Private fields specific to Mewtwo
  final List<String> _weaknesses;
  final String _type;

  // Constructor
  Mewtwo()
    : _weaknesses = ['Dark', 'Ghost', 'Bug'],
      _type = 'Psychic',
      super('Mewtwo', 70, [
        Skill('Psychic', 90, 10),
        Skill('Shadow Ball', 80, 15),
        Skill('Recover', 0, 20),
        Skill('Future Sight', 120, 25),
      ]);

  // Getters for Mewtwo-specific properties
  List<String> get weaknesses => _weaknesses;
  String get type => _type;

  // Override displaySkills to show more Mewtwo-specific information
  @override
  void displaySkills() {
    print('\nMewtwo Information:');
    print('Type: $_type');
    print('Level: ${super.level}');
    print('Weaknesses: ${_weaknesses.join(", ")}');
    print('\nMewtwo\'s Skills:');
    super.displaySkills();
  }

  // Special method for Mewtwo's signature move
  void psystrike() {
    print('Mewtwo unleashes its signature move: Psystrike!');
    print('A powerful psychic blast that deals massive damage!');
  }
}
