part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}


class OrdersInitialEvent extends OrdersEvent {}

class OrderClickedEvent extends OrdersEvent{
  final OrderDataModel clickedOrder;
  OrderClickedEvent({required this.clickedOrder});
}