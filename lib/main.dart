// import 'testRace_prof.dart';

import 'Squirtle.dart';
import 'mewtwo.dart';
import 'Emboar.dart';

void main() {
  // Create a Squirtle instance with level 8
  var squirtle = Squirtle(8);

  // Display Squirtle's information and skills
  squirtle.displaySkills();

  print('\n'); // Add a blank line for separation

  // Create and display Mewtwo
  var mewtwo = Mewtwo();
  mewtwo.displaySkills();

  // Create and display Emboar
  var MBoar = Emboar();

  // Demonstrate Mewtwo's signature move
  print('\n');

  print("Squirtle HP: ${squirtle.health.toStringAsFixed(2)}");
  mewtwo.Psystrike(squirtle);
  print("Squirtle HP: ${squirtle.health.toStringAsFixed(2)}");

  // To see "healing" in action.
  print("Mewtwo HP: ${mewtwo.health.toStringAsFixed(2)}");
  mewtwo.Recover(mewtwo);
  print("Mewtwo HP: ${mewtwo.health.toStringAsFixed(2)}");

  // Witness Emboar in Action.
  MBoar.Flamethrower(mewtwo);
  print("Mewtwo HP: ${mewtwo.health.toStringAsFixed(2)}");

  MBoar.Earthquake(squirtle);
  print("Squirtle HP: ${squirtle.health.toStringAsFixed(2)}");
}
