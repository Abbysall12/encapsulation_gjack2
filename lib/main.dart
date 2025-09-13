import 'Squirtle.dart';
import 'mewtwo.dart';

void main() {
  // Create a Squirtle instance with level 8
  var squirtle = Squirtle(8);

  // Display Squirtle's information and skills
  squirtle.displaySkills();

  print('\n'); // Add a blank line for separation

  // Create and display Mewtwo
  var mewtwo = Mewtwo();
  mewtwo.displaySkills();

  // Demonstrate Mewtwo's signature move
  print('\n');
  mewtwo.psystrike();
}
