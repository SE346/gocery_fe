part of 'categories_overview_bloc.dart';

abstract class CategoriesOverviewEvent extends Equatable {
  const CategoriesOverviewEvent();
}

class CategoriesOverviewFetched extends CategoriesOverviewEvent {
  @override
  List<Object?> get props => [];
}

class NewCategoryAdded extends CategoriesOverviewEvent {
  final Category category;

  const NewCategoryAdded({required this.category});

  @override
  List<Object> get props => [category];
}
