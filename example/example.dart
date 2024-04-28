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

import 'package:xyz_security/xyz_security.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main() {
  // Define a list of characters to use for the transformation. Here we use the
  // hexadecimal character list since the input UUID is in hexadecimal format.
  // We can use any character list we like as long as it is unique and contains
  // at least all the characters in the input strings.
  final hexCharList = '0123456789abcdef';

  // Define a seed to use for the transformation. This can be any string.
  // It uses SHA256. Different seeds will produce different transformations.
  const PASSWORD = 'Password 123';

  // Create a mapper using the defined character list and seed.
  final mapper = BijectiveUuidMapper(
    seed: PASSWORD,
    charList: hexCharList,
  );

  // Generate a UUID using the 'uuid' package.
  final id = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';

  print('Original ID: $id');
  final mappedId = mapper.mapId(id);
  print('Mapped ID: $mappedId');
  final reverseMappedId = mapper.reverseMapId(mappedId);
  print('Reverse Mapped ID: $reverseMappedId');

  // Check if the reverse mapped ID is indded the same as the original ID.
  print(reverseMappedId == id ? 'Success!' : 'Failure!');
}
