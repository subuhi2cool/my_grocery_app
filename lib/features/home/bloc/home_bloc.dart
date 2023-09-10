import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/data/cart_item.dart';

import '../../../data/grocery_data.dart';
import '../model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductClickedEvent>(homeProductClickedEvent);
    on<HomeAddToCartClickedEvent>(homeAddToCartClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    //await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'] ,
        name: e['name'],
        description: e['description'],
        category: e['category'],
        inStock: e['inStock'],
        imageUrl: e['imageUrl'] ,
        price: (e['price']).toDouble()
    )).toList()));

  }


  FutureOr<void> homeProductClickedEvent(HomeProductClickedEvent event, Emitter<HomeState> emit) {
     emit(HomeShowBottomSheetState(event.clickedProduct));
  }

  FutureOr<void> homeAddToCartClickedEvent(HomeAddToCartClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
       emit(HomeProductCartedState());
  }
}
