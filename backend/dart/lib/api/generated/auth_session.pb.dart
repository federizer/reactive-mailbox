///
//  Generated code. Do not modify.
//  source: auth_session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;

import 'auth.pbenum.dart' as $0;

class AuthSession extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthSession', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..e<$0.AuthState>(1, 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.AuthState.SUCCESS, valueOf: $0.AuthState.valueOf, enumValues: $0.AuthState.values)
    ..aOS(2, 'accessToken')
    ..aOS(3, 'refreshToken')
    ..aOM<$0.UserInfoResponse>(4, 'userInfo', subBuilder: $0.UserInfoResponse.create)
    ..hasRequiredFields = false
  ;

  AuthSession._() : super();
  factory AuthSession() => create();
  factory AuthSession.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSession.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthSession clone() => AuthSession()..mergeFromMessage(this);
  AuthSession copyWith(void Function(AuthSession) updates) => super.copyWith((message) => updates(message as AuthSession));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSession create() => AuthSession._();
  AuthSession createEmptyInstance() => create();
  static $pb.PbList<AuthSession> createRepeated() => $pb.PbList<AuthSession>();
  @$core.pragma('dart2js:noInline')
  static AuthSession getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSession>(create);
  static AuthSession _defaultInstance;

  @$pb.TagNumber(1)
  $0.AuthState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.AuthState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshToken() => clearField(3);

  @$pb.TagNumber(4)
  $0.UserInfoResponse get userInfo => $_getN(3);
  @$pb.TagNumber(4)
  set userInfo($0.UserInfoResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserInfo() => clearField(4);
  @$pb.TagNumber(4)
  $0.UserInfoResponse ensureUserInfo() => $_ensure(3);
}

