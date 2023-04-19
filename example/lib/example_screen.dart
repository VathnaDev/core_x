import 'package:core_x/widgets/dev/dev_text_button.dart';
import 'package:example/features/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:core_x/extensions/context_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/bloc/authentication_bloc.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isSwitchEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          DevTextButton(
            title: "Dev Gallery",
            onTap: () {},
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (ctx, state) {
              return state.when(
                initial: SizedBox.shrink,
                unAuthenticated: SizedBox.shrink,
                authenticated: () => DevTextButton(
                  title: "Todos",
                  onTap: () {
                    ctx.to(const TodoListScreen());
                  },
                ),
              );
            },
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return state.when(
                initial: () => DevTextButton(
                  title: "UnAuthenticated",
                  onTap: () {
                    context.read<AuthenticationBloc>().add(const AuthenticationEvent.singIn());
                  },
                ),
                authenticated: () => DevTextButton(
                  title: "Authenticated",
                  onTap: () {
                    context.read<AuthenticationBloc>().add(const AuthenticationEvent.signOut());
                  },
                ),
                unAuthenticated: () => DevTextButton(
                  title: "UnAuthenticated",
                  onTap: () {
                    context.read<AuthenticationBloc>().add(const AuthenticationEvent.singIn());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
