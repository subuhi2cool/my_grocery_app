import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/features/orders/model/order_data_model.dart';
import '../../../data/cart_item.dart';
import '../../../data/orders_bills.dart';
import '../../home/model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartClearAllEvent>(cartClearAllEvent);
    on<CartCheckoutClickedEvent>(cartCheckoutClickedEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartClearAllEvent(CartClearAllEvent event, Emitter<CartState> emit) {
    cartItems.clear();
    emit(CartSuccessState(cartItems: cartItems));
  }


  FutureOr<void> cartCheckoutClickedEvent(CartCheckoutClickedEvent event, Emitter<CartState> emit) {
    orderedBills.add(event.order);
    cartItems.clear();
    emit(CartNavigateToOrdersState(orders: orderedBills));
  }
}
