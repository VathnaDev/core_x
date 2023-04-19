part of 'todo_list_cubit.dart';

@freezed
class TodoListState with _$TodoListState {
  @JsonSerializable()
  const factory TodoListState({
    @Default(false) bool isLoading,
    String? errorMessage,
    List<Todo>? todos,
  }) = _TodoListState;

  factory TodoListState.fromJson(Map<String, dynamic> json) => _$TodoListStateFromJson(json);
}
