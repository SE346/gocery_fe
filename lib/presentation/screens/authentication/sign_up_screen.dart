import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
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
              "Register",
              style: AppStyles.bold.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // btn login facebook
                Expanded(
                  child: CustomButton(
                    content: '',
                    margin: 0,
                    onTap: () {},
                    color: AppColors.text,
                    icon: Image.asset(
                      AppAssets.icApple,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // btn login gg
                Expanded(
                  child: CustomButton(
                    margin: 0,
                    content: '',
                    onTap: () {},
                    color: Colors.transparent,
                    icon: Image.asset(AppAssets.icGoogle),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),

            // email field
            TextFieldInput(
              controller: emailController,
              hintText: 'Email',
              type: TextInputType.emailAddress,
              prefixIcon: Image.asset(AppAssets.icEmail),
            ),
            const SizedBox(height: 15),
            // phone field
            TextFieldInput(
              controller: phoneController,
              hintText: 'Phone',
              type: TextInputType.number,
              prefixIcon: Image.asset(AppAssets.icPhone),
            ),
            const SizedBox(height: 15),
            // username
            TextFieldInput(
              controller: usernameController,
              hintText: 'Username',
              type: TextInputType.text,
              prefixIcon: Image.asset(AppAssets.icUser),
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
            const SizedBox(height: 15),
            // confirm password field
            TextFieldInput(
              controller: passwordController,
              hintText: 'Confirm Password',
              type: TextInputType.text,
              isPass: true,
              prefixIcon: Image.asset(AppAssets.icLock),
            ),
            const SizedBox(height: 30),
            // btn sign up
            CustomButton(
              content: 'Create Account',
              onTap: () {},
              margin: 0,
            ),
          ],
        ),
      ),
    );
  }
}
