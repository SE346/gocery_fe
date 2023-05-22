import 'package:flutter/material.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  const EditProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(AppAssets.icBack),
        ),
        title: Text(
          'Edit Profile',
          style: AppStyles.medium,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: AppStyles.medium.copyWith(
                color: const Color(0xFFFE9870),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const Spacer(),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1684166251886-5c4fbb1d3c5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60'),
                ),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(AppAssets.icCamera),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFieldInput(hintText: 'Email', controller: _mailController),
            const SizedBox(height: 10),
            TextFieldInput(
                hintText: 'First name', controller: _firstNameController),
            const SizedBox(height: 10),
            TextFieldInput(
                hintText: 'Last name', controller: _lastNameController),
            const SizedBox(height: 10),
            TextFieldInput(hintText: 'Gender', controller: _genderController),
            const SizedBox(height: 10),
            TextFieldInput(
                hintText: 'Phone Number', controller: _phoneController),
            // const AppText(
            //   text: 'MR/MRS',
            //   fontWeight: FontWeight.w500,
            //   size: 12,
            //   color: Color(0xFF7D8699),
            // ),
            // TextFieldInput(
            //   onChanged: (value) {},
            //   type: TextInputType.text,
            //   hintText: 'Mrs',
            //   controller: _genderController,
            // ),
            // const SizedBox(height: 20),
            // const AppText(
            //   text: 'FIRST NAME',
            //   fontWeight: FontWeight.w500,
            //   size: 12,
            //   color: Color(0xFF7D8699),
            // ),
            // TextFieldInput(
            //   onChanged: (value) {},
            //   type: TextInputType.text,
            //   hintText: 'Julia',
            //   controller: _firstNameController,
            // ),
            // const SizedBox(height: 20),
            // const AppText(
            //   text: 'LAST NAME',
            //   fontWeight: FontWeight.w500,
            //   size: 12,
            //   color: Color(0xFF7D8699),
            // ),
            // TextFieldInput(
            //   onChanged: (value) {},
            //   type: TextInputType.text,
            //   hintText: 'Andrews',
            //   controller: _lastNameController,
            // ),
            // const SizedBox(height: 20),
            // const AppText(
            //   text: 'PHONE NUMBERS',
            //   fontWeight: FontWeight.w500,
            //   size: 12,
            //   color: Color(0xFF7D8699),
            // ),
            // TextFieldInput(
            //   onChanged: (value) {},
            //   type: TextInputType.number,
            //   hintText: '426-980-0043',
            //   controller: _phoneController,
            // ),
          ],
        ),
      ),
    );
  }
}
