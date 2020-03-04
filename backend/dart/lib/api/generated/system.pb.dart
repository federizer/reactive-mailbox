///
//  Generated code. Do not modify.
//  source: system.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AliveResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AliveResponse', package: const $pb.PackageName('system'), createEmptyInstance: create)
    ..aOS(1, 'msg')
    ..hasRequiredFields = false
  ;

  AliveResponse._() : super();
  factory AliveResponse() => create();
  factory AliveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AliveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AliveResponse clone() => AliveResponse()..mergeFromMessage(this);
  AliveResponse copyWith(void Function(AliveResponse) updates) => super.copyWith((message) => updates(message as AliveResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AliveResponse create() => AliveResponse._();
  AliveResponse createEmptyInstance() => create();
  static $pb.PbList<AliveResponse> createRepeated() => $pb.PbList<AliveResponse>();
  @$core.pragma('dart2js:noInline')
  static AliveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AliveResponse>(create);
  static AliveResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);
}

