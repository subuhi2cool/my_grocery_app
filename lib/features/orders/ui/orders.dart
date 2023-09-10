import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';
import 'package:my_grocery_app/features/custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';
import 'package:my_grocery_app/features/orders/ui/bottom_sheet_orders.dart';
import '../../../data/orders_bills.dart';
import '../bloc/orders_bloc.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    ordersBloc.add(OrdersInitialEvent());
    super.initState();
  }
  final OrdersBloc ordersBloc = OrdersBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      bloc: ordersBloc,
      listener: (context, state) {
        if( state is OrdersShowBottomSheetState){
          showModalBottomSheet(context: context, builder: (context){
           return BottomSheetOrders(clickedOrder: state.clickedOrder, ordersBloc: ordersBloc);
          });
        }
      },
      buildWhen:  (previous, current) => current is OrdersLoadedSuccessState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case OrdersLoadedSuccessState:
            final successState = state as OrdersLoadedSuccessState;

            return Scaffold(
              appBar: CustomAppBar(title: tOrders),
              body: ListView.builder(
                  itemCount: successState.orders.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        ordersBloc.add(OrderClickedEvent(
                            clickedOrder:  successState.orders[index]
                        ));
                      },
                      child:  ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successState.orders[index].orderId, style: const TextStyle(fontSize: 18)),
                            Text("Placed At: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())}", style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        trailing: const Text('placed', style: TextStyle(fontSize: 18),),
                      ),
                    );
                  }),
              bottomNavigationBar: CustomBottomNavigationBar(newindex: 3,),
            );

          case OrdersErrorState:
            return const Scaffold(body: Center(child: Text('Error')));

          default:
            return const SizedBox();
        }


      }
    );
  }
}
