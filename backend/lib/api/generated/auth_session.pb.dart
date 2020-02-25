///
//  Generated code. Do not modify.
//  source: auth_session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $1;

class AuthSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthSessionRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..hasRequiredFields = false
  ;

  AuthSessionRequest._() : super();
  factory AuthSessionRequest() => create();
  factory AuthSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthSessionRequest clone() => AuthSessionRequest()..mergeFromMessage(this);
  AuthSessionRequest copyWith(void Function(AuthSessionRequest) updates) => super.copyWith((message) => updates(message as AuthSessionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSessionRequest create() => AuthSessionRequest._();
  AuthSessionRequest createEmptyInstance() => create();
  static $pb.PbList<AuthSessionRequest> createRepeated() => $pb.PbList<AuthSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSessionRequest>(create);
  static AuthSessionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class AuthSessionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthSessionResponse', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOM<$1.SignupResponse>(2, 'signup', subBuilder: $1.SignupResponse.create)
    ..aOM<$1.SigninResponse>(3, 'signin', subBuilder: $1.SigninResponse.create)
    ..aOM<$1.SignoutResponse>(4, 'signout', subBuilder: $1.SignoutResponse.create)
    ..aOM<$1.UserInfoResponse>(5, 'userInfo', subBuilder: $1.UserInfoResponse.create)
    ..hasRequiredFields = false
  ;

  AuthSessionResponse._() : super();
  factory AuthSessionResponse() => create();
  factory AuthSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthSessionResponse clone() => AuthSessionResponse()..mergeFromMessage(this);
  AuthSessionResponse copyWith(void Function(AuthSessionResponse) updates) => super.copyWith((message) => updates(message as AuthSessionResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSessionResponse create() => AuthSessionResponse._();
  AuthSessionResponse createEmptyInstance() => create();
  static $pb.PbList<AuthSessionResponse> createRepeated() => $pb.PbList<AuthSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSessionResponse>(create);
  static AuthSessionResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $1.SignupResponse get signup => $_getN(1);
  @$pb.TagNumber(2)
  set signup($1.SignupResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignup() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignup() => clearField(2);
  @$pb.TagNumber(2)
  $1.SignupResponse ensureSignup() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.SigninResponse get signin => $_getN(2);
  @$pb.TagNumber(3)
  set signin($1.SigninResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignin() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignin() => clearField(3);
  @$pb.TagNumber(3)
  $1.SigninResponse ensureSignin() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.SignoutResponse get signout => $_getN(3);
  @$pb.TagNumber(4)
  set signout($1.SignoutResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignout() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignout() => clearField(4);
  @$pb.TagNumber(4)
  $1.SignoutResponse ensureSignout() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.UserInfoResponse get userInfo => $_getN(4);
  @$pb.TagNumber(5)
  set userInfo($1.UserInfoResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserInfo() => clearField(5);
  @$pb.TagNumber(5)
  $1.UserInfoResponse ensureUserInfo() => $_ensure(4);
}

