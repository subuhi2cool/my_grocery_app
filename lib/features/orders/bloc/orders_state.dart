part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoadedSuccessState extends OrdersState {
  late final List<OrderDataModel> orders;
  OrdersLoadedSuccessState({required this.orders});
}

class OrdersShowBottomSheetState extends OrdersState {
  final OrderDataModel clickedOrder;
    OrdersShowBottomSheetState({required this.clickedOrder});
}

class OrdersErrorState extends OrdersState {}