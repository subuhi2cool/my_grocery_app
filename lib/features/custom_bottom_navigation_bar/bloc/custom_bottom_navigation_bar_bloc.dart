import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_bottom_navigation_bar_event.dart';
part 'custom_bottom_navigation_bar_state.dart';

class CustomBottomNavigationBarBloc
    extends Bloc<CustomBottomNavigationBarEvent, CustomBottomNavigationBarState> {
  CustomBottomNavigationBarBloc(): super(CustomBottomNavigationBarNavigateToHomeState()){
    on<CustomBottomNavigationBarEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeCustomBottomNavigationBarEvent>(homeCustomBottomNavigationBarEvent);
    on<CategoriesCustomBottomNavigationBarEvent>(categoriesCustomBottomNavigationBarEvent);
    on<CartCustomBottomNavigationBarEvent>(cartCustomBottomNavigationBarEvent);
    on<OrdersCustomBottomNavigationBarEvent>(ordersCustomBottomNavigationBarEvent);
  }

  FutureOr<void> homeCustomBottomNavigationBarEvent(HomeCustomBottomNavigationBarEvent event, Emitter<CustomBottomNavigationBarState> emit) {
    emit(CustomBottomNavigationBarNavigateToHomeState());
  }

  FutureOr<void> categoriesCustomBottomNavigationBarEvent(CategoriesCustomBottomNavigationBarEvent event, Emitter<CustomBottomNavigationBarState> emit) {
    emit(CustomBottomNavigationBarNavigateToCategoriesState());
  }

  FutureOr<void> cartCustomBottomNavigationBarEvent(CartCustomBottomNavigationBarEvent event, Emitter<CustomBottomNavigationBarState> emit) {
    emit(CustomBottomNavigationBarNavigateToCartState());
  }

  FutureOr<void> ordersCustomBottomNavigationBarEvent(OrdersCustomBottomNavigationBarEvent event, Emitter<CustomBottomNavigationBarState> emit) {
    emit(CustomBottomNavigationBarNavigateToOrdersState());
  }
}
