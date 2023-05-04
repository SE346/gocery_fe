import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/models/product_image.dart';
import 'package:grocery/data/services/cloudinary_service.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/services/add_edit_product_bloc/add_edit_product_bloc.dart';
import 'package:grocery/presentation/utils/functions.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/item_upload_group.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? product;
  final int idCategory;

  const AddEditProductScreen({
    super.key,
    required this.product,
    required this.idCategory,
  });

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  List<File> imageFiles = [];
  final _addProductFormKey = GlobalKey<FormState>();
  AddEditProductBloc get _bloc => BlocProvider.of<AddEditProductBloc>(context);

  @override
  void initState() {
    super.initState();
    categoryController.text = widget.idCategory.toString();
    _bloc.add(AddEditProductStarted(product: widget.product));
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    discountController.dispose();
    quantityController.dispose();
    categoryController.dispose();
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
      body: BlocConsumer<AddEditProductBloc, AddEditProductState>(
        listener: (context, state) {
          if (state is AddEditProductLoading) {
            LoadingScreen().show(context: context);
          } else if (state is AddEditProductFailure) {
            LoadingScreen().hide();
            showSnackBar(
              context,
              state.errorMessage,
              const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            );
          } else if (state is AddEditProductSuccess) {
            LoadingScreen().hide();

            Navigator.of(context).pop(state.product);
            // showSnackBar(
            //   context,
            //   'Add product successfully',
            //   const Icon(
            //     Icons.check,
            //     color: Colors.white,
            //   ),
            // );
          }
        },
        builder: (context, state) {
          if (state is AddEditProductInitial) {
            if (state.product != null) {
              Product product = state.product!;
              nameController.text = product.productName;
              descriptionController.text = product.productDescription;
              discountController.text = product.discount.toString();
              quantityController.text = "20";
              priceController.text = product.price.toString();
            }
          }
          return Form(
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
                      isEnabled: false,
                      hintText: 'Category',
                      controller: categoryController,
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
                      type: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    TextFieldInput(
                      hintText: 'Quantity',
                      controller: quantityController,
                      type: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Display Image',
                      style: AppStyles.medium.copyWith(),
                    ),
                    const SizedBox(height: 10),
                    ItemUploadGroup(
                      images: imageFiles,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        margin: 0,
                        content: 'Add Product',
                        onTap: () => addProduct(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void addProduct() async {
    if (_addProductFormKey.currentState!.validate()) {
      String nameProduct = nameController.text.trim();
      String description = descriptionController.text.trim();
      int categoryId = int.parse(categoryController.text.trim());
      int price = int.parse(priceController.text.trim());
      String unit = unitController.text.trim();
      int discount = int.parse(discountController.text.trim());
      //int quantity = int.parse(quantityController.text.trim());

      Product product = Product(
        categoryId: categoryId,
        productName: nameProduct,
        unit: unit,
        price: price,
        discount: discount,
        productDescription: description,
      );

      _bloc.add(
        ProductAdded(product: product, imageFiles: imageFiles),
      );
    }
  }
}
