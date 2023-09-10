part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadedResult extends SearchState {
  late final List<ProductDataModel> products;
  SearchLoadedResult({required this.products});
}

class SearchProductCartedState extends SearchState {}

class SearchErrorState extends SearchState {}