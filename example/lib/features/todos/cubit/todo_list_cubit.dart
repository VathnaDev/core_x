import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_x/utils/networks/dio_utils.dart';

import '../../../data/models/todo.dart';
import '../../../data/services/json_placeholder_service.dart';

part 'todo_list_state.dart';
part 'todo_list_cubit.freezed.dart';

class TodoListCubit extends Cubit<TodoListState> {
  late JsonPlaceholderService _jsonPlaceholderService;
  TodoListCubit() : super(const TodoListState.initial()) {
    final dio = DioUtils.getClient(url: "https://jsonplaceholder.typicode.com/");
    _jsonPlaceholderService = JsonPlaceholderService(dio);
    loadData();
  }

  void loadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await _jsonPlaceholderService.getTodos();
      emit(state.copyWith(isLoading: false, todos: todos));
    } catch (ex) {}
  }

  void refresh() async {
    emit(state.copyWith(isLoading: true));
    try {
      await Future.delayed(Duration(seconds: 3));
      final todos = await _jsonPlaceholderService.getTodos();
      emit(state.copyWith(isLoading: false, todos: [...(state.todos ?? []) + todos]));
    } catch (ex) {}
  }
}
