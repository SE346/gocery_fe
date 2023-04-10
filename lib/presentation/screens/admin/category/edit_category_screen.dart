import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/bottom_navigation_bar.dart/bottom_navigation_bar_screen.dart';
import 'package:grocery/presentation/services/category_bloc/category_bloc.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/item_add_image.dart';
import 'package:grocery/presentation/widgets/item_image.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class EditCategoryScreen extends StatefulWidget {
  final Category category;

  const EditCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final TextEditingController nameController = TextEditingController();
  Uint8List? image;
  late String img;
  final _addCategoryFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.category.name;
    img = AppAssets.icVegetables;
  }

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
        isCenterTitle: true,
        title: Text(
          widget.category.name,
          style: AppStyles.bold.copyWith(
            fontSize: 19,
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
                  img.isEmpty
                      ? ItemAddImage(callback: (imageSelected) {
                          setState(() {
                            image = imageSelected;
                          });
                        })
                      : imageAdded(),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomButton(
                      content: 'Update Category',
                      onTap: updateCategory,
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

  Widget imageAdded() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            AppAssets.brocoli,
            fit: BoxFit.cover,
            cacheWidth: 342,
            cacheHeight: 342,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: removeImage,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  color: AppColors.primary,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void removeImage() {
    setState(() {
      img = "";
    });
  }

  void updateCategory() {
    if (_addCategoryFormKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const BottomNavigationBarScreen(),
        ),
      );
      // Category category = Category(
      //   name: nameController.text,
      //   image: AppAssets.icVegetables,
      // );
      // context.read<CategoryBloc>().add(AddANewCategory(category: category));
    }
  }
}
