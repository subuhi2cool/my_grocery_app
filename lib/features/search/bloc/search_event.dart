part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchInitialEvent extends SearchEvent {}

class SearchProductEvent extends SearchEvent{
  late String  searchedProductExpression;
  SearchProductEvent({required this.searchedProductExpression});
}

class SearchAddToCartClickedEvent extends SearchEvent{
  late final ProductDataModel clickedProduct;
  SearchAddToCartClickedEvent({required this.clickedProduct});
}