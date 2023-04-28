import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/item_add_image.dart';
import 'package:grocery/presentation/widgets/item_image.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  File? imageFile;
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    discountController.dispose();
    quantityController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Add a Product',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Form(
        key: _addProductFormKey,
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
                TextFieldInput(
                  hintText: 'Description',
                  controller: descriptionController,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  hintText: 'Category',
                  controller: nameController,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldInput(
                        hintText: 'Price',
                        controller: priceController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFieldInput(
                        hintText: 'Unit',
                        controller: unitController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  hintText: 'Discount',
                  controller: discountController,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  hintText: 'Quantity',
                  controller: quantityController,
                ),
                const SizedBox(height: 10),
                Text(
                  'Display Image',
                  style: AppStyles.medium.copyWith(),
                ),
                const SizedBox(height: 10),
                imageFile == null
                    ? ItemAddImage(
                        callback: (imageSelected) {
                          setState(() {
                            imageFile = imageSelected;
                          });
                        },
                      )
                    : ItemImage(fileImage: imageFile!),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    margin: 0,
                    content: 'Add Product',
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
