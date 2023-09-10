import 'package:flutter/cupertino.dart';

import '../../../constants/colors.dart';
import '../model/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
   const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                color: tCardBgColor,
                image: DecorationImage(
                  image: NetworkImage(
                    productDataModel.imageUrl,
                  ),
                ),
              )),
          Text(
            productDataModel.name,
            style: TextStyle(
              fontSize: 15,
           //  fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
