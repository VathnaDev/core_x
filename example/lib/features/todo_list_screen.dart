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
      create: (context) => TodoListCubit(),
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
          // title: BlocBuilder<TodoListCubit, TodoListState>(
          //   bloc: context.read(),
          //   builder: (context, state) {
          //     if (state.isLoading) {
          //       return const Text("Fetching Data");
          //     } else {
          //       return Text("Todos ${state.todos?.length}");
          //     }
          //   },
          // ),
          title: Builder(builder: (context) {
            return Text("Todos ${context.select((TodoListCubit value) => value.state.todos?.length)}");
          }),
        ),
        body: BlocBuilder<TodoListCubit, TodoListState>(
          bloc: context.read(),
          builder: (context, state) {
            if (state.isLoading && state.todos == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
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
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              context.read<TodoListCubit>().refresh();
            },
            child: Icon(Icons.refresh),
          );
        }),
      ),
    );
  }
}