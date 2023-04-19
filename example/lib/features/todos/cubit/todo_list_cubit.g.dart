// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoListState _$$_TodoListStateFromJson(Map<String, dynamic> json) =>
    _$_TodoListState(
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
      todos: (json['todos'] as List<dynamic>?)
          ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TodoListStateToJson(_$_TodoListState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'todos': instance.todos,
    };
