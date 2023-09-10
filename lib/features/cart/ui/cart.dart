import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';
import 'package:my_grocery_app/features/custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';
import 'package:my_grocery_app/features/orders/model/order_data_model.dart';
import 'package:my_grocery_app/features/orders/ui/orders.dart';
import 'package:uuid/uuid.dart';

import '../../home/model/home_product_data_model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: tCart),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if(state is CartNavigateToOrdersState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Your order is placed !')));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Orders()));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              double totalBill = 0;
              for(var product in successState.cartItems){
                totalBill += product.price ;
              }
              String roundedOffBill = totalBill.toStringAsFixed(2);
              String orderId = '';
              List<String> orderedProductsNames = [];
              List<ProductDataModel> cartItemList = successState.cartItems;
              for (ProductDataModel product in cartItemList){
                orderedProductsNames.add(product.name);
              }
              return Column(
                children: [
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cartBloc.add(CartClearAllEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              1.0), // Set border radius here
                        ),
                      ),
                      child: const Text(
                        'Clear All', style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: successState.cartItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(successState.cartItems[index].name,
                              style: const TextStyle(fontSize: 16),),
                            trailing: Text(successState.cartItems[index].price
                                .toString(), style: const TextStyle(
                                fontSize: 16),),
                          );
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        orderId = '${DateTime.now().millisecondsSinceEpoch}-${const Uuid().v1()}'.substring(0,18);
                        OrderDataModel   orderDataModel = OrderDataModel(
                            orderId: orderId,
                            totalBill: roundedOffBill,
                            orderedProductNames: orderedProductsNames,
                            );
                        cartBloc.add(CartCheckoutClickedEvent(order: orderDataModel));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              1.0), // Set border radius here
                        ),
                      ),
                      child: totalBill != 0 ? Text('Checkout  $roundedOffBill', style: const TextStyle(fontSize: 18),)
                     : const Text('Add some products in your cart.', style: TextStyle(fontSize: 18),),
          ),
                  ),
                ],
              );

            default:
              return Container();
          }
        }
    ),
      bottomNavigationBar: CustomBottomNavigationBar(newindex: 2,),
    );
  }
}
