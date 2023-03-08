import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/bottom_navigation_bar_page.dart/bottom_navigation_bar_screen.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
          vertical: kTopPadding,
        ),
        child: ListView(
          children: [
            Text(
              'Login to continue',
              style: AppStyles.bold.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 40),
            // email field
            TextFieldInput(
              controller: emailController,
              hintText: 'Email',
              type: TextInputType.emailAddress,
              prefixIcon: Image.asset(AppAssets.icEmail),
            ),
            const SizedBox(height: 15),
            // password field
            TextFieldInput(
              controller: passwordController,
              hintText: 'Password',
              type: TextInputType.text,
              isPass: true,
              prefixIcon: Image.asset(AppAssets.icLock),
            ),
            const SizedBox(height: 50),
            // btn login
            CustomButton(
              content: 'Log In',
              onTap: navigateToBottomNavigationScreen,
              margin: 0,
            ),
            const SizedBox(height: 10),
            // forgot password
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: AppStyles.medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToBottomNavigationScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const BottomNavigationBarScreen(),
      ),
    );
  }
}
