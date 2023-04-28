import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/services/cloudinary_service.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/services/category_bloc/category_bloc.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/item_add_image.dart';
import 'package:grocery/presentation/widgets/item_image.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController nameController = TextEditingController();
  File? imageFile;
  final _addCategoryFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Add a Category',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoaded) {
            if (state.isLoading) {
              return LoadingScreen().show(context: context);
            } else {
              LoadingScreen().hide();
              Navigator.of(context).pop();
            }
          }
        },
        child: Form(
          key: _addCategoryFormKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    hintText: 'Name Category',
                    controller: nameController,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Display Image',
                    style: AppStyles.medium.copyWith(),
                  ),
                  const SizedBox(height: 10),
                  imageFile == null
                      ? ItemAddImage(callback: (imageSelected) {
                          setState(() {
                            imageFile = imageSelected;
                          });
                        })
                      : ItemImage(fileImage: imageFile!),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomButton(
                      content: 'Add Category',
                      onTap: addCategory,
                      width: size.width * .4,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addCategory() async {
    if (_addCategoryFormKey.currentState!.validate()) {
      context.read<CategoryBloc>().add(
            AddANewCategory(
              nameCategory: nameController.text,
              imageFile: imageFile!,
            ),
          );
    }
  }
}
