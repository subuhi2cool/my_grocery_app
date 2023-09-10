import 'package:flutter/material.dart';
import '../../home/model/home_product_data_model.dart';
import '../bloc/categories_bloc.dart';

class BottomSheetCategories extends StatelessWidget {
   final String clickedCategory;
   final List<ProductDataModel> products;
  final CategoriesBloc categoriesBloc;
  const BottomSheetCategories(this.products, this.clickedCategory, this.categoriesBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductDataModel> productInClickedCategory = [];
    for (var product in products) {
       if(product.category == clickedCategory){
        productInClickedCategory.add(product);
      }
    }

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            clickedCategory,
            style: const TextStyle(
              fontSize: 42,
            ),
          ),
           Expanded(
             child: ListView.builder(
                      itemCount: productInClickedCategory.length,
                       itemBuilder: (context,index){
                        return Column(
                          children:[
                          const SizedBox(height: 8),
                            ListTile(
                                title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(productInClickedCategory[index].name,style: const TextStyle(fontWeight: FontWeight.bold),),
                                          Row(
                                            children: [
                                              const Text("Price: "),
                                              Text((productInClickedCategory[index].price).toString()),
                                            ],
                                          ),
                                       ],
                                     ),
                                   TextButton(
                                    onPressed: (){
                                      categoriesBloc.add(CategoriesAddToCartClickedEvent(clickedProduct: productInClickedCategory[index]));
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to the Cart')));
                                      Navigator.of(context).pop();
                                      },
                                      child: const Text("ADD",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),)),
                                ],
                              ),
                            ),
                          ],
                        );
                  }),
           ),

         // const SizedBox(height: 20,),
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



