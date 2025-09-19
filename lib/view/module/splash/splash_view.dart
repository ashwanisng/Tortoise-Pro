import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart'
    show AppColors;
import 'package:flutter_bloc_starter/view/module/home/home_view.dart'
    show HomeView;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3300), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Text('Splash Screen')),
    );
  }
}
