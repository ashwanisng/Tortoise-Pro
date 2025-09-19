import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/utils/theme/app_theme.dart' show AppTheme;
import 'package:flutter_bloc_starter/utils/values/env.dart' show Env;
import 'package:flutter_bloc_starter/view/module/splash/splash_view.dart' show SplashView;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

      ],
      child: MaterialApp(
        title: Env.title,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SplashView(),
      ),
    );
  }
}
