import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/screens/authentication/login_screen.dart';
import 'package:grocery/presentation/services/profile_bloc/profile_bloc.dart';
import 'package:grocery/presentation/utils/functions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc get _bloc => BlocProvider.of<ProfileBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
            LoadingScreen().hide();
            showSnackBar(
              context,
              state.errorMessage,
              const Icon(Icons.error_outline),
            );
          } else if (state is ProfileLoading) {
            LoadingScreen().show(context: context);
          } else {
            LoadingScreen().hide();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            );
          }
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _bloc.add(ProfileLoggedOut());
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
