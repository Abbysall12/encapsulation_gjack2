// damage_calculation.dart
// Self-explanatory.

// Formula:
// Physical Resistance * Elemental Resistance * Base_damage = FinalDamage
// Simple in the head, pain in the ass in execution.

import 'testRace_prof.dart';
import 'base_class.dart';

// Setting down and declaring types.
// NOTE: FLAT IS USED FOR CERTAIN ATTACKS TO ONLY DEAL ITS ASSIGNED BASE VALUE OF ITS RESPECTIVE TYPE.
enum PhysType { Slash, Pierce, Blunt, Flat }
enum ElemType { Fire, Water, Earth, Nature, Dark, Ghost, Psychic, Bug, Flat, Normal }

// Adding the value for the severity of either resistance/weakness.
enum ResisType {
  Immune(0.0),
  Ineffective(0.5),
  Normal(1.0),
  Weak(1.5),
  Fatal(2.0);

  final double multiplier;              // So that those silly values next to those words above-
  const ResisType(this.multiplier);     // -will actually apply as a number to be used.
}

// Declared damage attributes and it's types -- respectively, Physical and Elemental then the baseDamage.
class DamageAttribute {
  final PhysType physicalType;
  final ElemType elementType;
  final double baseDamage;

  DamageAttribute(this.physicalType, this.elementType, this.baseDamage);  // How DamageAttribute should be used.

  // ^^^ ex. DamageAttribute(PhysType.Slash, ElemType.Fire, 80);

  double calculateDamageAgainst(Trainer target) {
    // Direct resistances (overrides)
    final directPhysRes = target.getResistance(physicalType);       // Checks for Overrides in Physical Resistance if ever, else default to Normal.
    final directElemRes = target.getResistance(elementType);        // Checks for Overrides in Elemental Resistance if ever, else default to Normal.

    // Race-based resistances
    final raceProfile = RaceDatabase.getProfile(target.race);             // Asks for the list of Races and its vulnerabilities.
    final racePhysRes = raceProfile.getPhysicalResistance(physicalType);  // Checks for Physical Resistance then takes it.
    final raceElemRes = raceProfile.getElementalResistance(elementType);  // Checks for Elemental Resistance then takes it.

    // Combine multipliers
    final totalPhysMult = directPhysRes.multiplier * racePhysRes.multiplier;  // Combines the two factors into one.
    final totalElemMult = directElemRes.multiplier * raceElemRes.multiplier;  // Does the same thing except for Elemental.

    // Apply damage split: 50% physical, 50% elemental since-
    // -old way of calculating damage only needed one type of
    // damage -- be it Physical nor Elemental -- could effec-
    // -tively nullify an attack to deal ZERO DAMAGE with how
    // it was handling the logic of the formula. :skull:
    final physDamage = (baseDamage / 2) * totalPhysMult;
    final elemDamage = (baseDamage / 2) * totalElemMult;

    final finalDamage = physDamage + elemDamage;          // Final Damage.

    // Optional debug log
/*
    print('\n=== Damage Debugg Breakdown ===');
    print('Target: ${target.name}');
    print('Base Damage: $baseDamage');
    print('Physical: ${physicalType.name} → $directPhysRes (override) x $racePhysRes (race) = $totalPhysMult');
    print('Elemental: ${elementType.name} → $directElemRes (override) x $raceElemRes (race) = $totalElemMult');
    print('-> Physical Portion: ${physDamage.toStringAsFixed(2)}');
    print('-> Elemental Portion: ${elemDamage.toStringAsFixed(2)}');
    print('-> Final Damage Dealt: ${finalDamage.toStringAsFixed(2)}');
    print('=========================\n');
*/

    return finalDamage;
  }
}


