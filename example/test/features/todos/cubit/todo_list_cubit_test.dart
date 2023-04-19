import 'package:bloc_test/bloc_test.dart';
import 'package:core_x/app_bloc_observer.dart';
import 'package:core_x/utils/networks/dio_utils.dart';
import 'package:example/data/models/todo.dart';
import 'package:example/data/services/json_placeholder_service.dart';
import 'package:example/features/todos/cubit/todo_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

import '../../../data/services/json_placeholder_service_mock.dart';
import '../../../mock_storage.dart';

void main() {
  late Storage storage;
  late Dio dio;
  late JsonPlaceholderServiceMock service;
  late Todo sampleTodo;
  late Future<List<Todo>> sampleTodos;

  setUp(() async {
    Bloc.observer = AppBlocObserver();
    storage = MockStorage();
    service = JsonPlaceholderServiceMock();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});

    sampleTodo = Todo(
      userId: 0,
      id: 0,
      title: "Mock",
      completed: false,
    );

    sampleTodos = Future.value([sampleTodo]);
    when(() => service.getTodos()).thenAnswer((_) => sampleTodos);

    HydratedBloc.storage = storage;
  });

  group('TodoListCubit Happy Path 🚀', () {
    blocTest(
      'initial state will fetch data from api',
      build: () => TodoListCubit(jsonPlaceholderService: service),
      expect: () => [
        TodoListState(isLoading: false, todos: [sampleTodo]),
      ],
    );

    blocTest(
      'emit [TodoListState] when loadData called',
      build: () => TodoListCubit(jsonPlaceholderService: service),
      act: (bloc) => [
        // bloc.loadData(),
      ],
      expect: () => [
        // const TodoListState(isLoading: true, todos: null),
        TodoListState(isLoading: false, todos: [sampleTodo]),
      ],
      verify: (bloc) => [
        verify(() => service.getTodos()).called(1),
        expect(service.getTodos(), sampleTodos),
      ],
    );

    blocTest(
      'emit [TodoListState] with error when loadData called error from api',
      setUp: () {
        when(() => service.getTodos()).thenThrow(Exception("Http Error"));
      },
      build: () => TodoListCubit(jsonPlaceholderService: service),
      act: (bloc) => [
        bloc.loadData(),
        bloc.clearError(),
      ],
      skip: 1,
      expect: () => [
        // Load data called
        const TodoListState(isLoading: false, errorMessage: "Exception: Http Error"),

        // clear error after read
        const TodoListState(isLoading: false, errorMessage: null),
      ],
      verify: (bloc) => [
        verify(() => service.getTodos()).called(2),
      ],
    );
  });
}
