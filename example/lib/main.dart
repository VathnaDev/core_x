import 'dart:io';

import 'package:core_x/utils/networks/dio_utils.dart';
import 'package:core_x/app_bloc_observer.dart';
import 'package:example/data/services/json_placeholder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'example_screen.dart';
import 'features/auth/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint(Platform.environment.toString());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        RepositoryProvider(
          create: (_) => DioUtils.getClient(url: "https://jsonplaceholder.typicode.com/"),
        ),
        RepositoryProvider(
          create: (context) => JsonPlaceholderService(context.read()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(Brightness.dark),
        home: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            print(state);
            state.whenOrNull(unAuthenticated: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            });
          },
          child: ExampleScreen(),
        ),
      ),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      primarySwatch: Colors.blue,
      brightness: brightness,
      useMaterial3: true,
    );

    return baseTheme.copyWith();
  }
}
