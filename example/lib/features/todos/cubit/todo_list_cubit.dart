import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_x/utils/networks/dio_utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/todo.dart';
import '../../../data/services/json_placeholder_service.dart';

part 'todo_list_state.dart';
part 'todo_list_cubit.g.dart';
part 'todo_list_cubit.freezed.dart';


class TodoListCubit extends HydratedCubit<TodoListState> {
  late JsonPlaceholderService _jsonPlaceholderService;
  TodoListCubit() : super(const TodoListState()) {
    final dio = DioUtils.getClient(url: "https://jsonplaceholder.typicode.com/");
    _jsonPlaceholderService = JsonPlaceholderService(dio);
    if (fromJson(cached)?.todos == null) {
      loadData();
    }
  }

  void loadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await _jsonPlaceholderService.getTodos();
      emit(state.copyWith(isLoading: false, todos: todos));
    } catch (ex) {}
  }

  void loadMore() async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await _jsonPlaceholderService.getTodos();
      emit(state.copyWith(isLoading: false, todos: [...(state.todos ?? []) + todos]));
    } catch (ex) {}
  }

  @override
  Map<String, dynamic>? toJson(TodoListState state) => state.toJson();

  @override
  TodoListState? fromJson(Map<String, dynamic> json) {
    return TodoListState.fromJson(json);
  }
}

extension HydrateBlocStorageExt on HydratedMixin {
  Map<String, dynamic> get cached {
    return HydratedBloc.storage.read(storageToken);
  }
}
