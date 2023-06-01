// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthState {
  AuthClient? get client => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)
        $default, {
    required TResult Function(AuthClient? client) initial,
    required TResult Function(AuthClient? client) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult? Function(AuthClient? client)? initial,
    TResult? Function(AuthClient? client)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult Function(AuthClient? client)? initial,
    TResult Function(AuthClient? client)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleAuthState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GoogleAuthState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleAuthState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthStateCopyWith<GoogleAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthStateCopyWith<$Res> {
  factory $GoogleAuthStateCopyWith(
          GoogleAuthState value, $Res Function(GoogleAuthState) then) =
      _$GoogleAuthStateCopyWithImpl<$Res, GoogleAuthState>;
  @useResult
  $Res call({AuthClient? client});
}

/// @nodoc
class _$GoogleAuthStateCopyWithImpl<$Res, $Val extends GoogleAuthState>
    implements $GoogleAuthStateCopyWith<$Res> {
  _$GoogleAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_value.copyWith(
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as AuthClient?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $GoogleAuthStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthClient? client});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_$_Initial(
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as AuthClient?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.client});

  @override
  final AuthClient? client;

  @override
  String toString() {
    return 'GoogleAuthState.initial(client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.client, client) || other.client == client));
  }

  @override
  int get hashCode => Object.hash(runtimeType, client);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)
        $default, {
    required TResult Function(AuthClient? client) initial,
    required TResult Function(AuthClient? client) loading,
  }) {
    return initial(client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult? Function(AuthClient? client)? initial,
    TResult? Function(AuthClient? client)? loading,
  }) {
    return initial?.call(client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult Function(AuthClient? client)? initial,
    TResult Function(AuthClient? client)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleAuthState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GoogleAuthState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleAuthState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GoogleAuthState {
  const factory _Initial({final AuthClient? client}) = _$_Initial;

  @override
  AuthClient? get client;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $GoogleAuthStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthClient? client});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_$_Loading(
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as AuthClient?,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({this.client});

  @override
  final AuthClient? client;

  @override
  String toString() {
    return 'GoogleAuthState.loading(client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            (identical(other.client, client) || other.client == client));
  }

  @override
  int get hashCode => Object.hash(runtimeType, client);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)
        $default, {
    required TResult Function(AuthClient? client) initial,
    required TResult Function(AuthClient? client) loading,
  }) {
    return loading(client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult? Function(AuthClient? client)? initial,
    TResult? Function(AuthClient? client)? loading,
  }) {
    return loading?.call(client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult Function(AuthClient? client)? initial,
    TResult Function(AuthClient? client)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleAuthState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GoogleAuthState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleAuthState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GoogleAuthState {
  const factory _Loading({final AuthClient? client}) = _$_Loading;

  @override
  AuthClient? get client;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoogleAuthStateCopyWith<$Res>
    implements $GoogleAuthStateCopyWith<$Res> {
  factory _$$_GoogleAuthStateCopyWith(
          _$_GoogleAuthState value, $Res Function(_$_GoogleAuthState) then) =
      __$$_GoogleAuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GoogleSignInAccount? account,
      AuthClient? client,
      Map<String, String>? headers});
}

/// @nodoc
class __$$_GoogleAuthStateCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$_GoogleAuthState>
    implements _$$_GoogleAuthStateCopyWith<$Res> {
  __$$_GoogleAuthStateCopyWithImpl(
      _$_GoogleAuthState _value, $Res Function(_$_GoogleAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? client = freezed,
    Object? headers = freezed,
  }) {
    return _then(_$_GoogleAuthState(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as AuthClient?,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$_GoogleAuthState implements _GoogleAuthState {
  const _$_GoogleAuthState(
      {required this.account,
      required this.client,
      required final Map<String, String>? headers})
      : _headers = headers;

  @override
  final GoogleSignInAccount? account;
  @override
  final AuthClient? client;
  final Map<String, String>? _headers;
  @override
  Map<String, String>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GoogleAuthState(account: $account, client: $client, headers: $headers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleAuthState &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.client, client) || other.client == client) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, client,
      const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleAuthStateCopyWith<_$_GoogleAuthState> get copyWith =>
      __$$_GoogleAuthStateCopyWithImpl<_$_GoogleAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)
        $default, {
    required TResult Function(AuthClient? client) initial,
    required TResult Function(AuthClient? client) loading,
  }) {
    return $default(account, client, headers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult? Function(AuthClient? client)? initial,
    TResult? Function(AuthClient? client)? loading,
  }) {
    return $default?.call(account, client, headers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleSignInAccount? account, AuthClient? client,
            Map<String, String>? headers)?
        $default, {
    TResult Function(AuthClient? client)? initial,
    TResult Function(AuthClient? client)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(account, client, headers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleAuthState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GoogleAuthState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleAuthState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GoogleAuthState implements GoogleAuthState {
  const factory _GoogleAuthState(
      {required final GoogleSignInAccount? account,
      required final AuthClient? client,
      required final Map<String, String>? headers}) = _$_GoogleAuthState;

  GoogleSignInAccount? get account;
  @override
  AuthClient? get client;
  Map<String, String>? get headers;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleAuthStateCopyWith<_$_GoogleAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
