part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class CategoriesInitialEvent extends CategoriesEvent {}

class CategoryClickedEvent extends CategoriesEvent{
  final String clickedCategory;
  CategoryClickedEvent({required this.clickedCategory});
}

class CategoriesAddToCartClickedEvent extends CategoriesEvent{
  late final ProductDataModel clickedProduct;
  CategoriesAddToCartClickedEvent({required this.clickedProduct});
}