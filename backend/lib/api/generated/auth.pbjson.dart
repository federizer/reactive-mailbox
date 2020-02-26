///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AuthState$json = const {
  '1': 'AuthState',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'FAILURE', '2': 1},
    const {'1': 'USER_SIGNED_UP', '2': 2},
    const {'1': 'USER_SIGNED_IN', '2': 3},
    const {'1': 'USER_SIGNED_OUT', '2': 4},
  ],
};

const Credentials$json = const {
  '1': 'Credentials',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'credentials', '3': 1, '4': 1, '5': 11, '6': '.auth.Credentials', '10': 'credentials'},
  ],
};

const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'credentials', '3': 1, '4': 1, '5': 11, '6': '.auth.Credentials', '9': 0, '10': 'credentials'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'refreshToken'},
  ],
  '8': const [
    const {'1': 'auth'},
  ],
};

const SignOutRequest$json = const {
  '1': 'SignOutRequest',
  '2': const [
    const {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

const SignOutResponse$json = const {
  '1': 'SignOutResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.auth.AuthState', '10': 'state'},
  ],
};

const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

const ResetPasswordRespone$json = const {
  '1': 'ResetPasswordRespone',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

const VerifyEmailRequest$json = const {
  '1': 'VerifyEmailRequest',
  '2': const [
    const {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

const VerifyEmailRespone$json = const {
  '1': 'VerifyEmailRespone',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

const UserInfoResponse$json = const {
  '1': 'UserInfoResponse',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'given_name', '3': 4, '4': 1, '5': 9, '10': 'givenName'},
    const {'1': 'family_name', '3': 5, '4': 1, '5': 9, '10': 'familyName'},
    const {'1': 'data', '3': 6, '4': 1, '5': 12, '9': 0, '10': 'data'},
    const {'1': 'uri', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'uri'},
  ],
  '8': const [
    const {'1': 'picture'},
  ],
};

