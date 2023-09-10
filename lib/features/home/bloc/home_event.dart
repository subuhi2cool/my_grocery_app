part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;
  HomeProductClickedEvent({required this.clickedProduct});
}

class HomeAddToCartClickedEvent extends HomeEvent{
  late final ProductDataModel clickedProduct;
  HomeAddToCartClickedEvent({required this.clickedProduct});
}