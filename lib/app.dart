import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/screens/onboarding/splash_screen.dart';
import 'package:grocery/presentation/services/bottom_navigation_bloc/cubit/navigation_cubit.dart';

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
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Grocery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
