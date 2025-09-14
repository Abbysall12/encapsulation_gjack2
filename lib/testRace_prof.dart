// race_profile.dart
// Responsible for the existence of preset races and it's weaknesses/vulnerabilities.

import 'testDMG_calc.dart';

enum Race { Dummy, Bug, Fighter, Psychic, Water }

class RaceProfile {
  final Map<PhysType, ResisType> _physicalResistances = {};
  final Map<ElemType, ResisType> _elementalResistances = {};

// Sets down template for Physical Res.
  void setPhysicalResistance(PhysType type, ResisType resistance) {
    _physicalResistances[type] = resistance;
  }

// Sets down template for Elemental Res.
  void setElementalResistance(ElemType type, ResisType resistance) {
    _elementalResistances[type] = resistance;
  }

// When requesting for Physical Res., actually reply with a fall-back net so the code wouldn't shit itself.
  ResisType getPhysicalResistance(PhysType type) {
    return _physicalResistances[type] ?? ResisType.Normal;
  }

// When requesting for Elemental Res., actually reply with a fall-back net so the code wouldn't shit itself.
  ResisType getElementalResistance(ElemType type) {
    return _elementalResistances[type] ?? ResisType.Normal;
  }
}

class RaceDatabase {        // Placeholder for races recorded.
  static final Map<Race, RaceProfile> _profiles = {
    Race.Dummy: _createDummyProfile(),
    Race.Bug: _createBugProfile(),
    Race.Fighter: _createFighterProfile(),
    Race.Psychic: _createPsychicProfile(),
    Race.Water: _createWaterProfile()
    // Add more race profiles here if needed
  };

  static RaceProfile getProfile(Race race) {
    return _profiles[race] ?? RaceProfile(); // Return empty profile if missing
  }

  // The concurrent existing/available profile for use, displaying-
  // the contents of race's weaknesses/resistances.
  // The first one is a placeholder.

  // CyrusYouFngIdiot: POV: WALL OF TEXT.
  static RaceProfile _createDummyProfile() {
    final Dummy = RaceProfile();

    Dummy.setPhysicalResistance(PhysType.Slash, ResisType.Normal);    // Slash, Normal -- 1.0
    Dummy.setPhysicalResistance(PhysType.Pierce, ResisType.Normal);   // Pierce, Normal -- 1.0
    Dummy.setPhysicalResistance(PhysType.Blunt, ResisType.Normal);    // Blunt, Normal -- 1.0

    Dummy.setPhysicalResistance(PhysType.Flat, ResisType.Normal);     // Used to only deal its assigned value.

    Dummy.setElementalResistance(ElemType.Fire, ResisType.Immune);        // Fire, Immune -- 0.0
    Dummy.setElementalResistance(ElemType.Water, ResisType.Ineffective);  // Water, Ineffective -- 0.5
    Dummy.setElementalResistance(ElemType.Earth, ResisType.Weak);         // Earth, Weak -- 1.5
    Dummy.setElementalResistance(ElemType.Nature, ResisType.Fatal);       // Nature, Fatal -- 2.0
    Dummy.setElementalResistance(ElemType.Dark, ResisType.Normal);        // Dark, Normal -- 1.0
    Dummy.setElementalResistance(ElemType.Ghost, ResisType.Fatal);        // Ghost, Fatal -- 2.0
    Dummy.setElementalResistance(ElemType.Psychic, ResisType.Weak);       // Psychic, Weak -- 1.5
    Dummy.setElementalResistance(ElemType.Bug, ResisType.Ineffective);    // Bug, Ineffective -- 0.5
    Dummy.setElementalResistance(ElemType.Normal, ResisType.Normal);      // Normal, Normal -- 1.0

    Dummy.setElementalResistance(ElemType.Flat, ResisType.Normal);     // Used to only deal its assigned value.

    return Dummy;
  }

  static RaceProfile _createBugProfile() {      // Bug Race
    final Bug = RaceProfile();

    Bug.setPhysicalResistance(PhysType.Slash, ResisType.Ineffective);
    Bug.setPhysicalResistance(PhysType.Pierce, ResisType.Normal);
    Bug.setPhysicalResistance(PhysType.Blunt, ResisType.Weak);

    Bug.setPhysicalResistance(PhysType.Flat, ResisType.Normal);

    Bug.setElementalResistance(ElemType.Fire, ResisType.Fatal);
    Bug.setElementalResistance(ElemType.Water, ResisType.Weak);
    Bug.setElementalResistance(ElemType.Earth, ResisType.Ineffective);
    Bug.setElementalResistance(ElemType.Nature, ResisType.Ineffective);
    Bug.setElementalResistance(ElemType.Dark, ResisType.Normal);
    Bug.setElementalResistance(ElemType.Ghost, ResisType.Normal);
    Bug.setElementalResistance(ElemType.Psychic, ResisType.Weak);
    Bug.setElementalResistance(ElemType.Bug, ResisType.Ineffective);
    Bug.setElementalResistance(ElemType.Normal, ResisType.Normal);

    Bug.setElementalResistance(ElemType.Flat, ResisType.Normal);

    return Bug;
  }

  static RaceProfile _createFighterProfile() {  // Fighter race/type
    final Fighter = RaceProfile();

    Fighter.setPhysicalResistance(PhysType.Slash, ResisType.Normal);
    Fighter.setPhysicalResistance(PhysType.Pierce, ResisType.Weak);
    Fighter.setPhysicalResistance(PhysType.Blunt, ResisType.Ineffective);

    Fighter.setPhysicalResistance(PhysType.Flat, ResisType.Normal);

    Fighter.setElementalResistance(ElemType.Fire, ResisType.Fatal);
    Fighter.setElementalResistance(ElemType.Water, ResisType.Ineffective);
    Fighter.setElementalResistance(ElemType.Earth, ResisType.Ineffective);
    Fighter.setElementalResistance(ElemType.Nature, ResisType.Normal);
    Fighter.setElementalResistance(ElemType.Dark, ResisType.Normal);
    Fighter.setElementalResistance(ElemType.Ghost, ResisType.Weak);
    Fighter.setElementalResistance(ElemType.Psychic, ResisType.Weak);
    Fighter.setElementalResistance(ElemType.Bug, ResisType.Ineffective);
    Fighter.setElementalResistance(ElemType.Normal, ResisType.Normal);

    Fighter.setElementalResistance(ElemType.Flat, ResisType.Normal);

    return Fighter;
  }

  static RaceProfile _createPsychicProfile() {  // Psychic type/race
    final Psychic = RaceProfile();

    Psychic.setPhysicalResistance(PhysType.Slash, ResisType.Normal);
    Psychic.setPhysicalResistance(PhysType.Pierce, ResisType.Ineffective);
    Psychic.setPhysicalResistance(PhysType.Blunt, ResisType.Weak);

    Psychic.setElementalResistance(ElemType.Flat, ResisType.Normal);

    Psychic.setElementalResistance(ElemType.Fire, ResisType.Normal);
    Psychic.setElementalResistance(ElemType.Water, ResisType.Ineffective);
    Psychic.setElementalResistance(ElemType.Earth, ResisType.Weak);
    Psychic.setElementalResistance(ElemType.Nature, ResisType.Ineffective);
    Psychic.setElementalResistance(ElemType.Dark, ResisType.Ineffective);
    Psychic.setElementalResistance(ElemType.Ghost, ResisType.Normal);
    Psychic.setElementalResistance(ElemType.Psychic, ResisType.Ineffective);
    Psychic.setElementalResistance(ElemType.Bug, ResisType.Weak);
    Psychic.setElementalResistance(ElemType.Normal, ResisType.Normal);

    Psychic.setElementalResistance(ElemType.Flat, ResisType.Normal);

    return Psychic;
  }

  static RaceProfile _createWaterProfile() {  // Water type/race
    final Water = RaceProfile();

    Water.setPhysicalResistance(PhysType.Slash, ResisType.Normal);
    Water.setPhysicalResistance(PhysType.Pierce, ResisType.Ineffective);
    Water.setPhysicalResistance(PhysType.Blunt, ResisType.Weak);

    Water.setElementalResistance(ElemType.Flat, ResisType.Normal);

    Water.setElementalResistance(ElemType.Fire, ResisType.Weak);
    Water.setElementalResistance(ElemType.Water, ResisType.Ineffective);
    Water.setElementalResistance(ElemType.Earth, ResisType.Weak);
    Water.setElementalResistance(ElemType.Nature, ResisType.Ineffective);
    Water.setElementalResistance(ElemType.Dark, ResisType.Ineffective);
    Water.setElementalResistance(ElemType.Ghost, ResisType.Normal);
    Water.setElementalResistance(ElemType.Psychic, ResisType.Ineffective);
    Water.setElementalResistance(ElemType.Bug, ResisType.Normal);
    Water.setElementalResistance(ElemType.Normal, ResisType.Normal);

    Water.setElementalResistance(ElemType.Flat, ResisType.Normal);

    return Water;
  }
}
