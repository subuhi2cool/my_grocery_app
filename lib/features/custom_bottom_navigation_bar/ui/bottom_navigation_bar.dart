import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/features/categories/ui/categories.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';
import '../../cart/ui/cart.dart';
import '../../home/ui/home.dart';
import '../../orders/ui/orders.dart';
import '../bloc/custom_bottom_navigation_bar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key, required this.newindex});

  final int newindex;
  final CustomBottomNavigationBarBloc customBottomNavigationBarBloc = CustomBottomNavigationBarBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
        CustomBottomNavigationBarBloc,
        CustomBottomNavigationBarState>(
        bloc: customBottomNavigationBarBloc,
        listenWhen: (previous,
            current) => current is CustomBottomNavigationBarState,
        buildWhen: (previous,
            current) => current is! CustomBottomNavigationBarState,       listener: (context, state) {
          if (state is CustomBottomNavigationBarNavigateToHomeState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }
          else
          if (state is CustomBottomNavigationBarNavigateToCategoriesState) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Categories()));
          }
          else
          if (state is CustomBottomNavigationBarNavigateToCartState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          }
          else
          if (state is CustomBottomNavigationBarNavigateToOrdersState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Orders()));
          }
        },
        builder: (context, state) {
          return BottomNavigationBar(
           // currentIndex: _currentIndexFromState(state),
            currentIndex: newindex,
            selectedItemColor: tPrimaryColor,
            unselectedItemColor: tUnSelectedColor,
            onTap: (index) {
              if(index == 0) {
                customBottomNavigationBarBloc.add(
                    HomeCustomBottomNavigationBarEvent());
              }
              else if(index == 1){
                customBottomNavigationBarBloc.add(
                    CategoriesCustomBottomNavigationBarEvent());
              }
              else if(index == 2){
                customBottomNavigationBarBloc.add(
                    CartCustomBottomNavigationBarEvent());
              }
              else if(index == 3){
                customBottomNavigationBarBloc.add(
                    OrdersCustomBottomNavigationBarEvent());
              }


            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: tHome),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: tCategories),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: tCart),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), label: tOrders),
            ],
          );
        });
  }



 /* int _currentIndexFromState(CustomBottomNavigationBarState state) {
    if (state is CustomBottomNavigationBarNavigateToHomeState) return 0;
    if (state is CustomBottomNavigationBarNavigateToCategoriesState) return 1;
    if (state is CustomBottomNavigationBarNavigateToCartState) return 2;
    if (state is CustomBottomNavigationBarNavigateToOrdersState) return 3;
    return 0; // Default to home
  }


  CustomBottomNavigationBarEvent _eventFromIndex(int index) {
    switch (index) {
      case 0:
        return HomeCustomBottomNavigationBarEvent();
      case 1:
        return CategoriesCustomBottomNavigationBarEvent();
      case 2:
        return CartCustomBottomNavigationBarEvent();
      case 3:
        return OrdersCustomBottomNavigationBarEvent();
      default:
        return HomeCustomBottomNavigationBarEvent();
        // Default to home
    }
  }*/
}

