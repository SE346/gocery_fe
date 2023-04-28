import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/repository/category_repository.dart';
import 'package:grocery/data/services/cloudinary_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  // resource
  late CategoryRepository categoryRepository;

  // Data
  List<Category> categories = [];

  CategoryBloc(this.categoryRepository) : super(CategoryLoading()) {
    on<GetCategories>(_getCategories);
    // on<SelectACategory>(_selectHoliday);
    on<AddANewCategory>(_addANewCategory);
    // on<DeleteACategory>(_deleteHoliday);
  }

  void _getCategories(GetCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());

    List<Category> categoryList =
        await categoryRepository.getCategories() ?? [];

    categories = categoryList;

    emit(CategoryLoaded(categories: categories));
  }

  void _addANewCategory(
      AddANewCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: categories, isLoading: true));

    String urlImage = await uploadImage(event.imageFile);
    Category category = Category(name: event.nameCategory, image: urlImage);

    await categoryRepository.addCategory(category);

    categories.add(category);

    emit(CategoryLoaded(categories: categories, isAdd: true));
  }

  Future<String> uploadImage(File imageFile) async {
    String? urlImage =
        await CloudinaryService().uploadImage(imageFile.path, 'categories');
    return urlImage ?? '';
  }
}
