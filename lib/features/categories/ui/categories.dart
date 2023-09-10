import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/categories/bloc/categories_bloc.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';
import 'package:my_grocery_app/features/custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';

import 'bottom_sheet_categories.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    categoriesBloc.add(CategoriesInitialEvent());
    super.initState();
  }

  final CategoriesBloc categoriesBloc = CategoriesBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      bloc: categoriesBloc,
      listener: (context, state) {
        if (state is CategoriesShowBottomSheetState) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetCategories(
                  state.products, state.clickedCategory, categoriesBloc
                    );
              });
        }
           },
      buildWhen: (previous, current) => current is CategoriesLoadedSuccessState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CategoriesLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

          case CategoriesLoadedSuccessState:
            final successState = state as CategoriesLoadedSuccessState;
            var categoriesItem = <String>{};
            for (var productData in successState.products) {
              String category = productData.category;
              if (!categoriesItem.contains(category)) {
                categoriesItem.add(category);
              }
            }
            return Scaffold(
              appBar: CustomAppBar(title: tCategories),
              body: ListView.builder(
                  itemCount: categoriesItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        categoriesBloc.add(CategoryClickedEvent(
                        clickedCategory: categoriesItem.toList()[index],
                      ));},
                      child: ListTile(
                        title: Text(categoriesItem.toList()[index]),
                      ),
                    );
                  }),
              bottomNavigationBar: CustomBottomNavigationBar(
                newindex: 1,
              ),
            );

          case CategoriesErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      }
    );

  }
}
