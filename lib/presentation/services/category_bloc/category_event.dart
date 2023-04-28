part of 'category_bloc.dart';

abstract class CategoryEvent {
  const CategoryEvent();
}

class GetCategories extends CategoryEvent {}

class SelectACategory extends CategoryEvent {
  final String id;
  SelectACategory({
    required this.id,
  });
}

class AddANewCategory extends CategoryEvent {
  final String nameCategory;
  final File imageFile;

  AddANewCategory({
    required this.nameCategory,
    required this.imageFile,
  });
}

class DeleteACategory extends CategoryEvent {
  final String id;
  DeleteACategory({
    required this.id,
  });
}
