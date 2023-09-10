import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/orders_bills.dart';
import '../../home/model/home_product_data_model.dart';
import '../model/order_data_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
  on<OrdersInitialEvent>(ordersInitialEvent);
  on<OrderClickedEvent>(orderClickedEvent);
  }

  FutureOr<void> ordersInitialEvent(OrdersInitialEvent event, Emitter<OrdersState> emit) {
   emit(OrdersLoadedSuccessState(orders: orderedBills));
  }

  FutureOr<void> orderClickedEvent(OrderClickedEvent event, Emitter<OrdersState> emit) {
     emit(OrdersShowBottomSheetState(clickedOrder: event.clickedOrder));
  }
}
