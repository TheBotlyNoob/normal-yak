// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These types are ignored because they are not used by any `pub` functions: `Error`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `bits`, `clone`, `clone`, `clone`, `fmt`, `fmt`, `fmt`, `fmt`, `from_bits_retain`, `from`, `from`, `source`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<MatrixClient>>
abstract class MatrixClient implements RustOpaqueInterface {
  Future<LoginTypes> loginTypes();

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<MatrixClient> newInstance({required RustUrl homeserver}) =>
      RustLib.instance.api
          .crateApiMatrixMatrixClientNew(homeserver: homeserver);
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<RustUrl>>
abstract class RustUrl implements RustOpaqueInterface {}

class InnerLoginTypes {
  final int field0;

  const InnerLoginTypes({
    required this.field0,
  });

  bool hasApplicationService() =>
      RustLib.instance.api.crateApiMatrixInnerLoginTypesHasApplicationService(
        that: this,
      );

  bool hasPassword() =>
      RustLib.instance.api.crateApiMatrixInnerLoginTypesHasPassword(
        that: this,
      );

  bool hasSso() => RustLib.instance.api.crateApiMatrixInnerLoginTypesHasSso(
        that: this,
      );

  bool hasToken() => RustLib.instance.api.crateApiMatrixInnerLoginTypesHasToken(
        that: this,
      );

  bool hasUnknown() =>
      RustLib.instance.api.crateApiMatrixInnerLoginTypesHasUnknown(
        that: this,
      );

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InnerLoginTypes &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class LoginTypes {
  final List<RumaLoginType> real;
  final InnerLoginTypes inner;

  const LoginTypes({
    required this.real,
    required this.inner,
  });

  @override
  int get hashCode => real.hashCode ^ inner.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginTypes &&
          runtimeType == other.runtimeType &&
          real == other.real &&
          inner == other.inner;
}