part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartClearAllEvent extends CartEvent {}

class CartCheckoutClickedEvent extends CartEvent {
   final  OrderDataModel order;
  CartCheckoutClickedEvent({required this.order});
}
