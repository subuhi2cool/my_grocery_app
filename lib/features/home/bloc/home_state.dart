part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState {}

class HomeInitial extends HomeState {

}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  late final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeShowBottomSheetState extends HomeState {
  final ProductDataModel clickedProduct;
   HomeShowBottomSheetState(this.clickedProduct);
}

class HomeProductCartedState extends HomeState {}

class HomeErrorState extends HomeState {}


