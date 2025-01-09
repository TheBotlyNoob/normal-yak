// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/matrix.dart';
import 'api/util.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'lib.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.7.0';

  @override
  int get rustContentHash => 1748702267;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust_lib_normal_yak',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<LoginTypes> crateApiMatrixMatrixClientLoginTypes(
      {required MatrixClient that});

  Future<MatrixClient> crateApiMatrixMatrixClientNew(
      {required RustUrl homeserver});

  bool crateApiMatrixInnerLoginTypesHasApplicationService(
      {required InnerLoginTypes that});

  bool crateApiMatrixInnerLoginTypesHasPassword(
      {required InnerLoginTypes that});

  bool crateApiMatrixInnerLoginTypesHasSso({required InnerLoginTypes that});

  bool crateApiMatrixInnerLoginTypesHasToken({required InnerLoginTypes that});

  bool crateApiMatrixInnerLoginTypesHasUnknown({required InnerLoginTypes that});

  bool crateApiUtilIsRustUrlHttps({required RustUrl url});

  RustUrl? crateApiUtilParseRustUrl({required String url});

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_MatrixClient;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_MatrixClient;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_MatrixClientPtr;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_RumaLoginType;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_RumaLoginType;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_RumaLoginTypePtr;

  RustArcIncrementStrongCountFnType get rust_arc_increment_strong_count_RustUrl;

  RustArcDecrementStrongCountFnType get rust_arc_decrement_strong_count_RustUrl;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_RustUrlPtr;
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<LoginTypes> crateApiMatrixMatrixClientLoginTypes(
      {required MatrixClient that}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
            that, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 1, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_login_types,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiMatrixMatrixClientLoginTypesConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixMatrixClientLoginTypesConstMeta =>
      const TaskConstMeta(
        debugName: "MatrixClient_login_types",
        argNames: ["that"],
      );

  @override
  Future<MatrixClient> crateApiMatrixMatrixClientNew(
      {required RustUrl homeserver}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
            homeserver, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiMatrixMatrixClientNewConstMeta,
      argValues: [homeserver],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixMatrixClientNewConstMeta =>
      const TaskConstMeta(
        debugName: "MatrixClient_new",
        argNames: ["homeserver"],
      );

  @override
  bool crateApiMatrixInnerLoginTypesHasApplicationService(
      {required InnerLoginTypes that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_inner_login_types(that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 3)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiMatrixInnerLoginTypesHasApplicationServiceConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta
      get kCrateApiMatrixInnerLoginTypesHasApplicationServiceConstMeta =>
          const TaskConstMeta(
            debugName: "inner_login_types_has_application_service",
            argNames: ["that"],
          );

  @override
  bool crateApiMatrixInnerLoginTypesHasPassword(
      {required InnerLoginTypes that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_inner_login_types(that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 4)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiMatrixInnerLoginTypesHasPasswordConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixInnerLoginTypesHasPasswordConstMeta =>
      const TaskConstMeta(
        debugName: "inner_login_types_has_password",
        argNames: ["that"],
      );

  @override
  bool crateApiMatrixInnerLoginTypesHasSso({required InnerLoginTypes that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_inner_login_types(that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 5)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiMatrixInnerLoginTypesHasSsoConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixInnerLoginTypesHasSsoConstMeta =>
      const TaskConstMeta(
        debugName: "inner_login_types_has_sso",
        argNames: ["that"],
      );

  @override
  bool crateApiMatrixInnerLoginTypesHasToken({required InnerLoginTypes that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_inner_login_types(that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 6)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiMatrixInnerLoginTypesHasTokenConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixInnerLoginTypesHasTokenConstMeta =>
      const TaskConstMeta(
        debugName: "inner_login_types_has_token",
        argNames: ["that"],
      );

  @override
  bool crateApiMatrixInnerLoginTypesHasUnknown(
      {required InnerLoginTypes that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_inner_login_types(that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 7)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiMatrixInnerLoginTypesHasUnknownConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiMatrixInnerLoginTypesHasUnknownConstMeta =>
      const TaskConstMeta(
        debugName: "inner_login_types_has_unknown",
        argNames: ["that"],
      );

  @override
  bool crateApiUtilIsRustUrlHttps({required RustUrl url}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
            url, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 8)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilIsRustUrlHttpsConstMeta,
      argValues: [url],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilIsRustUrlHttpsConstMeta => const TaskConstMeta(
        debugName: "is_rust_url_https",
        argNames: ["url"],
      );

  @override
  RustUrl? crateApiUtilParseRustUrl({required String url}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(url, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 9)!;
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilParseRustUrlConstMeta,
      argValues: [url],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilParseRustUrlConstMeta => const TaskConstMeta(
        debugName: "parse_rust_url",
        argNames: ["url"],
      );

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_MatrixClient => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_MatrixClient => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_RumaLoginType => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_RumaLoginType => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_RustUrl => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_RustUrl => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  MatrixClient
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return MatrixClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RumaLoginType
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return RumaLoginTypeImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RustUrl
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return RustUrlImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  MatrixClient
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return MatrixClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RustUrl
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return RustUrlImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  MatrixClient
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return MatrixClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RumaLoginType
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return RumaLoginTypeImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RustUrl
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return RustUrlImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  RustUrl
      dco_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
        raw);
  }

  @protected
  InnerLoginTypes dco_decode_box_autoadd_inner_login_types(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_inner_login_types(raw);
  }

  @protected
  InnerLoginTypes dco_decode_inner_login_types(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return InnerLoginTypes(
      field0: dco_decode_u_8(arr[0]),
    );
  }

  @protected
  List<RumaLoginType>
      dco_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>)
        .map(
            dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType)
        .toList();
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  LoginTypes dco_decode_login_types(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return LoginTypes(
      real:
          dco_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
              arr[0]),
      inner: dco_decode_inner_login_types(arr[1]),
    );
  }

  @protected
  RustUrl?
      dco_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null
        ? null
        : dco_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
            raw);
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  MatrixClient
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return MatrixClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RumaLoginType
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return RumaLoginTypeImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RustUrl
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return RustUrlImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  MatrixClient
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return MatrixClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RustUrl
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return RustUrlImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  MatrixClient
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return MatrixClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RumaLoginType
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return RumaLoginTypeImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RustUrl
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return RustUrlImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  RustUrl
      sse_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
        deserializer));
  }

  @protected
  InnerLoginTypes sse_decode_box_autoadd_inner_login_types(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_inner_login_types(deserializer));
  }

  @protected
  InnerLoginTypes sse_decode_inner_login_types(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_field0 = sse_decode_u_8(deserializer);
    return InnerLoginTypes(field0: var_field0);
  }

  @protected
  List<RumaLoginType>
      sse_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <RumaLoginType>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(
          sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
              deserializer));
    }
    return ans_;
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  LoginTypes sse_decode_login_types(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_real =
        sse_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
            deserializer);
    var var_inner = sse_decode_inner_login_types(deserializer);
    return LoginTypes(real: var_real, inner: var_inner);
  }

  @protected
  RustUrl?
      sse_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          deserializer));
    } else {
      return null;
    }
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          MatrixClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as MatrixClientImpl).frbInternalSseEncode(move: true),
        serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          RumaLoginType self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as RumaLoginTypeImpl).frbInternalSseEncode(move: true),
        serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          RustUrl self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as RustUrlImpl).frbInternalSseEncode(move: true), serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          MatrixClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as MatrixClientImpl).frbInternalSseEncode(move: false),
        serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          RustUrl self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as RustUrlImpl).frbInternalSseEncode(move: false), serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMatrixClient(
          MatrixClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as MatrixClientImpl).frbInternalSseEncode(move: null),
        serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          RumaLoginType self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as RumaLoginTypeImpl).frbInternalSseEncode(move: null),
        serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          RustUrl self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as RustUrlImpl).frbInternalSseEncode(move: null), serializer);
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void
      sse_encode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          RustUrl self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
        self, serializer);
  }

  @protected
  void sse_encode_box_autoadd_inner_login_types(
      InnerLoginTypes self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_inner_login_types(self, serializer);
  }

  @protected
  void sse_encode_inner_login_types(
      InnerLoginTypes self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_8(self.field0, serializer);
  }

  @protected
  void
      sse_encode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          List<RumaLoginType> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
          item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_login_types(LoginTypes self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRumaLoginType(
        self.real, serializer);
    sse_encode_inner_login_types(self.inner, serializer);
  }

  @protected
  void
      sse_encode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          RustUrl? self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustUrl(
          self, serializer);
    }
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}

@sealed
class MatrixClientImpl extends RustOpaque implements MatrixClient {
  // Not to be used by end users
  MatrixClientImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  MatrixClientImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_MatrixClient,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_MatrixClient,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_MatrixClientPtr,
  );

  Future<LoginTypes> loginTypes() =>
      RustLib.instance.api.crateApiMatrixMatrixClientLoginTypes(
        that: this,
      );
}

@sealed
class RumaLoginTypeImpl extends RustOpaque implements RumaLoginType {
  // Not to be used by end users
  RumaLoginTypeImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  RumaLoginTypeImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RumaLoginType,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RumaLoginType,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_RumaLoginTypePtr,
  );
}

@sealed
class RustUrlImpl extends RustOpaque implements RustUrl {
  // Not to be used by end users
  RustUrlImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  RustUrlImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RustUrl,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RustUrl,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_RustUrlPtr,
  );
}
