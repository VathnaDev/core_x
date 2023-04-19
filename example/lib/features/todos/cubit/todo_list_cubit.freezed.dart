// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoListState _$TodoListStateFromJson(Map<String, dynamic> json) {
  return _TodoListState.fromJson(json);
}

/// @nodoc
mixin _$TodoListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Todo>? get todos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res, TodoListState>;
  @useResult
  $Res call({bool isLoading, List<Todo>? todos});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res, $Val extends TodoListState>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: freezed == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoListStateCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$$_TodoListStateCopyWith(
          _$_TodoListState value, $Res Function(_$_TodoListState) then) =
      __$$_TodoListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Todo>? todos});
}

/// @nodoc
class __$$_TodoListStateCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$_TodoListState>
    implements _$$_TodoListStateCopyWith<$Res> {
  __$$_TodoListStateCopyWithImpl(
      _$_TodoListState _value, $Res Function(_$_TodoListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todos = freezed,
  }) {
    return _then(_$_TodoListState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: freezed == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_TodoListState implements _TodoListState {
  const _$_TodoListState({this.isLoading = false, final List<Todo>? todos})
      : _todos = todos;

  factory _$_TodoListState.fromJson(Map<String, dynamic> json) =>
      _$$_TodoListStateFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  final List<Todo>? _todos;
  @override
  List<Todo>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TodoListState(isLoading: $isLoading, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoListStateCopyWith<_$_TodoListState> get copyWith =>
      __$$_TodoListStateCopyWithImpl<_$_TodoListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoListStateToJson(
      this,
    );
  }
}

abstract class _TodoListState implements TodoListState {
  const factory _TodoListState(
      {final bool isLoading, final List<Todo>? todos}) = _$_TodoListState;

  factory _TodoListState.fromJson(Map<String, dynamic> json) =
      _$_TodoListState.fromJson;

  @override
  bool get isLoading;
  @override
  List<Todo>? get todos;
  @override
  @JsonKey(ignore: true)
  _$$_TodoListStateCopyWith<_$_TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}
