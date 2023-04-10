import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/repository/category_repository.dart';

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

    await Future.delayed(const Duration(seconds: 2));
    List<Category> categoryList = categoryRepository.getCategories();
    categories = categoryList;
    emit(CategoryLoaded(categories: categories));
  }

  void _addANewCategory(
      AddANewCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: categories, isLoading: true));

    await Future.delayed(const Duration(seconds: 2));
    categories.add(event.category);

    emit(CategoryLoaded(categories: categories));
  }
}
