import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/models/product_image.dart';
import 'package:grocery/data/repository/product_repository.dart';

import '../../../data/services/cloudinary_service.dart';

part 'add_edit_product_event.dart';
part 'add_edit_product_state.dart';

class AddEditProductBloc
    extends Bloc<AddEditProductEvent, AddEditProductState> {
  final ProductRepository productRepository;

  AddEditProductBloc(this.productRepository) : super(AddEditProductInitial()) {
    on<AddEditProductStarted>(_onStarted);
    on<ProductAdded>(_onAdded);
  }

  void _onStarted(
      AddEditProductStarted event, Emitter<AddEditProductState> emit) {
    if (event.product != null) {
      emit(
        AddEditProductInitial(
          product: event.product,
        ),
      );
    }
  }

  FutureOr<void> _onAdded(
      ProductAdded event, Emitter<AddEditProductState> emit) async {
    emit(AddEditProductLoading());

    try {
      List<String> urls = await uploadImages(event.imageFiles);
      List<ProductImage> productImages = [];

      for (int i = 0; i < urls.length; i++) {
        ProductImage productImage = ProductImage(imgUrl: urls[i], index: i);
        productImages.add(productImage);
      }
      Product product = event.product!.copyWith(productImgList: productImages);
      Product result = await productRepository.addProduct(product);
      emit(AddEditProductSuccess(product: result));
    } catch (e) {
      emit(AddEditProductFailure(errorMessage: e.toString()));
    }
  }

  Future<List<String>> uploadImages(List<File> imageFiles) async {
    List<String> urls = [];

    for (var file in imageFiles) {
      String? urlImage =
          await CloudinaryService().uploadImage(file.path, 'products');
      urls.add(urlImage!);
    }
    return urls;
  }
}
