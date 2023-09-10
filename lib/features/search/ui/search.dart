import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';
import 'package:my_grocery_app/features/custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';
import '../../cart/ui/cart.dart';
import '../bloc/search_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    searchBloc.add(SearchInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: tSearch),
      body: BlocConsumer<SearchBloc, SearchState>(
        bloc: searchBloc,
        listener: (context, state) {
          if(state is SearchProductCartedState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to cart')));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          }
        },
        listenWhen: (previous, current) => current is SearchState,
        buildWhen: (previous, current) => current is SearchState,
        builder: (context, state) {
        switch (state.runtimeType) {
          case SearchInitial:
            return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
        controller: _searchController,
        onChanged: (context) {
        searchBloc.add(SearchProductEvent(searchedProductExpression: _searchController.text));
        },
        decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.green,
        )
        ),
        focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
              )
          ),
        hintText: 'Enter a product name',
        ),
        ));

          case SearchLoadedResult:
            final successState = state as SearchLoadedResult;
            print("matched products   ${successState.products.length}");
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (context) {
                  searchBloc.add(SearchProductEvent(searchedProductExpression: _searchController.text));
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          )
                      ),
                      hintText: 'Enter product name',
                    ),
                  ),),
                Expanded(
                  child: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(successState.products[index].name),
                        trailing: TextButton(
                            onPressed: (){
                              searchBloc.add(SearchAddToCartClickedEvent(clickedProduct: successState.products[index]));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to the Cart')));
                              Navigator.of(context).pop();
                            },
                            child: const Text("ADD",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),)),
                      );
                    },
                  ),
                ),

              ],
            );

          default:
            return Container();
        }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(newindex: 0,),
    );
  }
}
