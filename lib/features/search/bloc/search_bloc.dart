import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/features/home/model/home_product_data_model.dart';

import '../../../data/cart_item.dart';
import '../../../data/grocery_data.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
    on<SearchProductEvent>(searchProductEvent);
    on<SearchAddToCartClickedEvent>(searchAddToCartClickedEvent);
  }

   FutureOr<void> searchInitialEvent(SearchInitialEvent event, Emitter<SearchState> emit) {
  emit(SearchInitial());
  }

  FutureOr<void> searchProductEvent(SearchProductEvent event, Emitter<SearchState> emit) {
    late List<ProductDataModel>  matchedProducts = [];
    String regExp = event.searchedProductExpression;
    List<ProductDataModel> products =  GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'] ,
        name: e['name'],
        description: e['description'],
        category: e['category'],
        inStock: e['inStock'],
        imageUrl: e['imageUrl'] ,
        price: (e['price']).toDouble()
    )).toList();

    for(ProductDataModel product in products){
      print("regExp=====>>>>>  $regExp");
            if(product.name.contains(regExp)){
              print("Matched Product  =====>>>>>>  ${product.name}");
              matchedProducts.add(product);
            }
    }
    emit(SearchLoadedResult(products: matchedProducts));
  }

  FutureOr<void> searchAddToCartClickedEvent(SearchAddToCartClickedEvent event, Emitter<SearchState> emit) {
    cartItems.add(event.clickedProduct);
    emit(SearchProductCartedState());
  }
}



