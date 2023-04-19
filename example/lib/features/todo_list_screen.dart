import 'package:example/features/auth/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_x/extensions/number.dart';

import 'todos/cubit/todo_list_cubit.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListCubit>(
      create: (context) => TodoListCubit(
        jsonPlaceholderService: context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      const AuthenticationEvent.signOut(),
                    );
              },
            ),
          ],
          title: Builder(builder: (context) {
            return Text("Todos ${context.select((TodoListCubit value) => value.state.todos?.length) ?? 0}");
          }),
        ),
        body: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TodoListCubit>().loadData();
            },
            child: BlocConsumer<TodoListCubit, TodoListState>(
              listener: (context, state) async {
                if (state.errorMessage != null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.errorMessage!),
                    ),
                  );
                  context.read<TodoListCubit>().clearError();
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.todos == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (state.todos == null) return Container();
                  return ListView.builder(
                    padding: 16.paddingAllEdge,
                    itemCount: state.todos?.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text(state.todos![index].title),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              context.read<TodoListCubit>().loadMore();
            },
            child: Icon(Icons.data_array),
          );
        }),
      ),
    );
  }
}
