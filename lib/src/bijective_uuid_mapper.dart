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

import 'base_char_lists.dart' show BASE_16_CHAR_LIST_A;
import 'utils.dart' as utils;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BijectiveUuidMapper {
  //
  //
  //

  final String seed;
  final String charList;

  //
  //
  //

  BijectiveUuidMapper({
    required this.seed,
    this.charList = BASE_16_CHAR_LIST_A,
  });

  //
  //
  //

  late final digest = utils.generateDigestFromSeed(seed);

  //
  //
  //

  String map(String uuid) {
    return utils.bijectiveStringTransformationV1(
      source: uuid,
      digest: this.digest,
      charList: this.charList,
    );
  }

  //
  //
  //

  String unmap(String uuid) {
    return utils.reverseBijectiveStringTransformationV1(
      source: uuid,
      digest: digest,
      charList: this.charList,
    );
  }
}
