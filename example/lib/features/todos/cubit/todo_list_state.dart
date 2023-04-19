part of 'todo_list_cubit.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState.initial({
    @Default(false) bool isLoading,
    List<Todo>? todos,
  }) = _Initial;
}
