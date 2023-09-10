import 'package:flutter/material.dart';
import '../bloc/orders_bloc.dart';
import '../model/order_data_model.dart';

class BottomSheetOrders extends StatelessWidget {
  final OrderDataModel clickedOrder;
  final OrdersBloc ordersBloc;
  const BottomSheetOrders({super.key, required this.clickedOrder,required this.ordersBloc});

  @override
  Widget build(BuildContext context) {
      return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Order Items",
            style: TextStyle(
              fontSize: 42,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: clickedOrder.orderedProductNames.length,
                itemBuilder: (context,index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const SizedBox(height: 8),
                      ListTile(
                        title: Text(clickedOrder.orderedProductNames[index],style:  const TextStyle(fontSize: 20),),
                      ),
                    ],
                  );
                }),
          ),
          // const SizedBox(height: 20,),
          Text('Total: ₹ ${clickedOrder.totalBill}',style:  const TextStyle(fontSize: 30),),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CLOSE'),
            ),
          ),
        ],
      ),
    );
  }
}



