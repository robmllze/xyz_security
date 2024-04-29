//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

String shuffleStringV1(String inputString, int seed) {
  final length = inputString.length;
  final charCodes = inputString.codeUnits;
  final shuffledCodes = List<int>.filled(length, 0);

  // Constants for the linear congruential generator (LCG)
  const a = 1664525; // Multiplier
  const c = 1013904223; // Increment
  const m = 4294967296; // Modulus (2^32)

  // Seed the generator
  var random = seed;

  // Create an index permutation using the pseudo-random generator.
  var indices = List<int>.generate(length, (i) => i);

  // Implementing Fisher-Yates shuffle using our LCG.
  for (var i = length - 1; i > 0; i--) {
    random = (a * random + c) % m;
    var j = random % (i + 1);

    // Swap indices.
    final temp = indices[i];
    indices[i] = indices[j];
    indices[j] = temp;
  }

  // Arrange characters by shuffled indices.
  for (var i = 0; i < length; i++) {
    shuffledCodes[i] = charCodes[indices[i]];
  }

  return String.fromCharCodes(shuffledCodes);
}
