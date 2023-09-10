part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState{}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  late final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}

class CartNavigateToOrdersState extends CartActionState {
  late final List<OrderDataModel> orders;
  CartNavigateToOrdersState({required this.orders});
}