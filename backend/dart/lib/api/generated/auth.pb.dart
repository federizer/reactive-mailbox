///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pbenum.dart';

export 'auth.pbenum.dart';

class Credentials extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Credentials', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'username')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  Credentials._() : super();
  factory Credentials() => create();
  factory Credentials.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Credentials.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Credentials clone() => Credentials()..mergeFromMessage(this);
  Credentials copyWith(void Function(Credentials) updates) => super.copyWith((message) => updates(message as Credentials));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Credentials create() => Credentials._();
  Credentials createEmptyInstance() => create();
  static $pb.PbList<Credentials> createRepeated() => $pb.PbList<Credentials>();
  @$core.pragma('dart2js:noInline')
  static Credentials getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Credentials>(create);
  static Credentials _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class SignUpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignUpRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOM<Credentials>(1, 'credentials', subBuilder: Credentials.create)
    ..hasRequiredFields = false
  ;

  SignUpRequest._() : super();
  factory SignUpRequest() => create();
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  SignUpRequest createEmptyInstance() => create();
  static $pb.PbList<SignUpRequest> createRepeated() => $pb.PbList<SignUpRequest>();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest _defaultInstance;

  @$pb.TagNumber(1)
  Credentials get credentials => $_getN(0);
  @$pb.TagNumber(1)
  set credentials(Credentials v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCredentials() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredentials() => clearField(1);
  @$pb.TagNumber(1)
  Credentials ensureCredentials() => $_ensure(0);
}

enum SignInRequest_Auth {
  credentials, 
  refreshToken, 
  notSet
}

class SignInRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignInRequest_Auth> _SignInRequest_AuthByTag = {
    1 : SignInRequest_Auth.credentials,
    2 : SignInRequest_Auth.refreshToken,
    0 : SignInRequest_Auth.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignInRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Credentials>(1, 'credentials', subBuilder: Credentials.create)
    ..aOS(2, 'refreshToken')
    ..hasRequiredFields = false
  ;

  SignInRequest._() : super();
  factory SignInRequest() => create();
  factory SignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignInRequest clone() => SignInRequest()..mergeFromMessage(this);
  SignInRequest copyWith(void Function(SignInRequest) updates) => super.copyWith((message) => updates(message as SignInRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInRequest create() => SignInRequest._();
  SignInRequest createEmptyInstance() => create();
  static $pb.PbList<SignInRequest> createRepeated() => $pb.PbList<SignInRequest>();
  @$core.pragma('dart2js:noInline')
  static SignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInRequest>(create);
  static SignInRequest _defaultInstance;

  SignInRequest_Auth whichAuth() => _SignInRequest_AuthByTag[$_whichOneof(0)];
  void clearAuth() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Credentials get credentials => $_getN(0);
  @$pb.TagNumber(1)
  set credentials(Credentials v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCredentials() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredentials() => clearField(1);
  @$pb.TagNumber(1)
  Credentials ensureCredentials() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class SignOutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignOutRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'refreshToken')
    ..hasRequiredFields = false
  ;

  SignOutRequest._() : super();
  factory SignOutRequest() => create();
  factory SignOutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignOutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignOutRequest clone() => SignOutRequest()..mergeFromMessage(this);
  SignOutRequest copyWith(void Function(SignOutRequest) updates) => super.copyWith((message) => updates(message as SignOutRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignOutRequest create() => SignOutRequest._();
  SignOutRequest createEmptyInstance() => create();
  static $pb.PbList<SignOutRequest> createRepeated() => $pb.PbList<SignOutRequest>();
  @$core.pragma('dart2js:noInline')
  static SignOutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignOutRequest>(create);
  static SignOutRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

class SignOutResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignOutResponse', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..e<AuthState>(1, 'state', $pb.PbFieldType.OE, defaultOrMaker: AuthState.SUCCESS, valueOf: AuthState.valueOf, enumValues: AuthState.values)
    ..hasRequiredFields = false
  ;

  SignOutResponse._() : super();
  factory SignOutResponse() => create();
  factory SignOutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignOutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignOutResponse clone() => SignOutResponse()..mergeFromMessage(this);
  SignOutResponse copyWith(void Function(SignOutResponse) updates) => super.copyWith((message) => updates(message as SignOutResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignOutResponse create() => SignOutResponse._();
  SignOutResponse createEmptyInstance() => create();
  static $pb.PbList<SignOutResponse> createRepeated() => $pb.PbList<SignOutResponse>();
  @$core.pragma('dart2js:noInline')
  static SignOutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignOutResponse>(create);
  static SignOutResponse _defaultInstance;

  @$pb.TagNumber(1)
  AuthState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(AuthState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResetPasswordRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'refreshToken')
    ..aOS(2, 'newPassword')
    ..hasRequiredFields = false
  ;

  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest() => create();
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => clearField(2);
}

class ResetPasswordRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResetPasswordRespone', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'accessToken')
    ..aOS(2, 'refreshToken')
    ..hasRequiredFields = false
  ;

  ResetPasswordRespone._() : super();
  factory ResetPasswordRespone() => create();
  factory ResetPasswordRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResetPasswordRespone clone() => ResetPasswordRespone()..mergeFromMessage(this);
  ResetPasswordRespone copyWith(void Function(ResetPasswordRespone) updates) => super.copyWith((message) => updates(message as ResetPasswordRespone));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRespone create() => ResetPasswordRespone._();
  ResetPasswordRespone createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRespone> createRepeated() => $pb.PbList<ResetPasswordRespone>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRespone>(create);
  static ResetPasswordRespone _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class VerifyEmailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VerifyEmailRequest', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'refreshToken')
    ..aOS(2, 'email')
    ..hasRequiredFields = false
  ;

  VerifyEmailRequest._() : super();
  factory VerifyEmailRequest() => create();
  factory VerifyEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VerifyEmailRequest clone() => VerifyEmailRequest()..mergeFromMessage(this);
  VerifyEmailRequest copyWith(void Function(VerifyEmailRequest) updates) => super.copyWith((message) => updates(message as VerifyEmailRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRequest create() => VerifyEmailRequest._();
  VerifyEmailRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailRequest> createRepeated() => $pb.PbList<VerifyEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailRequest>(create);
  static VerifyEmailRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);
}

class VerifyEmailRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VerifyEmailRespone', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..aOS(1, 'accessToken')
    ..aOS(2, 'refreshToken')
    ..hasRequiredFields = false
  ;

  VerifyEmailRespone._() : super();
  factory VerifyEmailRespone() => create();
  factory VerifyEmailRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VerifyEmailRespone clone() => VerifyEmailRespone()..mergeFromMessage(this);
  VerifyEmailRespone copyWith(void Function(VerifyEmailRespone) updates) => super.copyWith((message) => updates(message as VerifyEmailRespone));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRespone create() => VerifyEmailRespone._();
  VerifyEmailRespone createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailRespone> createRepeated() => $pb.PbList<VerifyEmailRespone>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailRespone>(create);
  static VerifyEmailRespone _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

enum UserInfoResponse_Picture {
  data, 
  uri, 
  notSet
}

class UserInfoResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UserInfoResponse_Picture> _UserInfoResponse_PictureByTag = {
    6 : UserInfoResponse_Picture.data,
    7 : UserInfoResponse_Picture.uri,
    0 : UserInfoResponse_Picture.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserInfoResponse', package: const $pb.PackageName('auth'), createEmptyInstance: create)
    ..oo(0, [6, 7])
    ..aOS(1, 'username')
    ..aOS(2, 'email')
    ..aOS(3, 'name')
    ..aOS(4, 'givenName')
    ..aOS(5, 'familyName')
    ..a<$core.List<$core.int>>(6, 'data', $pb.PbFieldType.OY)
    ..aOS(7, 'uri')
    ..hasRequiredFields = false
  ;

  UserInfoResponse._() : super();
  factory UserInfoResponse() => create();
  factory UserInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserInfoResponse clone() => UserInfoResponse()..mergeFromMessage(this);
  UserInfoResponse copyWith(void Function(UserInfoResponse) updates) => super.copyWith((message) => updates(message as UserInfoResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoResponse create() => UserInfoResponse._();
  UserInfoResponse createEmptyInstance() => create();
  static $pb.PbList<UserInfoResponse> createRepeated() => $pb.PbList<UserInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static UserInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoResponse>(create);
  static UserInfoResponse _defaultInstance;

  UserInfoResponse_Picture whichPicture() => _UserInfoResponse_PictureByTag[$_whichOneof(0)];
  void clearPicture() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get givenName => $_getSZ(3);
  @$pb.TagNumber(4)
  set givenName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGivenName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGivenName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get familyName => $_getSZ(4);
  @$pb.TagNumber(5)
  set familyName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFamilyName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFamilyName() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get data => $_getN(5);
  @$pb.TagNumber(6)
  set data($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(6)
  void clearData() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uri => $_getSZ(6);
  @$pb.TagNumber(7)
  set uri($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUri() => $_has(6);
  @$pb.TagNumber(7)
  void clearUri() => clearField(7);
}

