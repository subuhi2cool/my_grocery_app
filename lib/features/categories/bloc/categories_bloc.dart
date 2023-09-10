import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_item.dart';
import '../../../data/grocery_data.dart';
import '../../home/model/home_product_data_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
  on<CategoriesInitialEvent>(categoriesInitialEvent);
  on<CategoryClickedEvent>(categoryClickedEvent);
  on<CategoriesAddToCartClickedEvent>(categoriesAddToCartClickedEvent);
    }

  Future<FutureOr<void>> categoriesInitialEvent(CategoriesInitialEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoadingState());
   // await Future.delayed(const Duration(seconds: 3));
    emit(CategoriesLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'] ,
        name: e['name'],
        description: e['description'],
        category: e['category'],
        inStock: e['inStock'],
        imageUrl: e['imageUrl'] ,
        price: (e['price']).toDouble()
    )).toList())
    );
  }

  FutureOr<void> categoryClickedEvent(CategoryClickedEvent event, Emitter<CategoriesState> emit) {
    emit(CategoriesShowBottomSheetState(event.clickedCategory,GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'] ,
        name: e['name'],
        description: e['description'],
        category: e['category'],
        inStock: e['inStock'],
        imageUrl: e['imageUrl'] ,
        price: (e['price']).toDouble()
    )).toList()));
  }



  FutureOr<void> categoriesAddToCartClickedEvent(CategoriesAddToCartClickedEvent event, Emitter<CategoriesState> emit) {
    cartItems.add(event.clickedProduct);
    emit(CategoriesProductCartedState());
  }
}
