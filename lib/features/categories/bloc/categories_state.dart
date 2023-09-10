part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedSuccessState extends CategoriesState {
  late final List<ProductDataModel> products;
  CategoriesLoadedSuccessState({required this.products});
}


class CategoriesShowBottomSheetState extends CategoriesState {
  final String clickedCategory;
  late final List<ProductDataModel> products;
  CategoriesShowBottomSheetState(this.clickedCategory,this.products);
}

class CategoriesProductCartedState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {}