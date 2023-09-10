import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';
import '../model/home_product_data_model.dart';

class BottomSheetWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const BottomSheetWidget(this.productDataModel, this.homeBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
           SizedBox(
            height: 250,
            width: 250,
            child: Image(image: NetworkImage(
                productDataModel.imageUrl,
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Price",),
              Text("₹${productDataModel.price}",style: const TextStyle(fontSize: 16),),
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("In Stock"),
              Text(productDataModel.inStock),
            ],

          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                homeBloc.add(HomeAddToCartClickedEvent(clickedProduct: productDataModel));
                Navigator.of(context).pop();
                },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}



