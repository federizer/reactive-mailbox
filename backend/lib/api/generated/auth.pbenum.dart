///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthState extends $pb.ProtobufEnum {
  static const AuthState SUCCESS = AuthState._(0, 'SUCCESS');
  static const AuthState FAILURE = AuthState._(1, 'FAILURE');
  static const AuthState USER_SIGNED_UP = AuthState._(2, 'USER_SIGNED_UP');
  static const AuthState USER_SIGNED_IN = AuthState._(3, 'USER_SIGNED_IN');
  static const AuthState USER_SIGNED_OUT = AuthState._(4, 'USER_SIGNED_OUT');

  static const $core.List<AuthState> values = <AuthState> [
    SUCCESS,
    FAILURE,
    USER_SIGNED_UP,
    USER_SIGNED_IN,
    USER_SIGNED_OUT,
  ];

  static final $core.Map<$core.int, AuthState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthState valueOf($core.int value) => _byValue[value];

  const AuthState._($core.int v, $core.String n) : super(v, n);
}

