import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';
import 'package:my_grocery_app/features/custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';
import 'package:my_grocery_app/features/home/ui/product_tile_widget.dart';
import '../../../constants/colors.dart';
import 'bottom_sheet_product_details.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeState,
       buildWhen: (previous, current) => current is HomeLoadedSuccessState,
    listener: (context, state) {
    if( state is HomeShowBottomSheetState){
      showModalBottomSheet(
          context: context,
          builder: (context) {
          return BottomSheetWidget(state.clickedProduct, homeBloc);
          });
    }
    else if (state is HomeProductCartedState){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to the Cart')));
    }

    },
    builder: (context, state) {
    switch (state.runtimeType) {
    case HomeLoadingState:
    return const Scaffold(
    body: Center(
    child: CircularProgressIndicator(),
    ));

    case HomeLoadedSuccessState:
    final successState = state as HomeLoadedSuccessState;
    return Scaffold(
    appBar: CustomAppBar(title: tHome),
    body: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    ),
    itemCount: successState.products.length,
    itemBuilder: (context, index) {
    return GestureDetector(
    onTap:(){ homeBloc.add(HomeProductClickedEvent(
    clickedProduct: successState.products[index],
    ));},
    child: Card(
    clipBehavior: Clip.antiAlias,
    color: tCardBgColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: GridTile(
    child: ProductTileWidget(
    productDataModel: successState.products[index],),
    ),
    ),
    );
    }),

    bottomNavigationBar: CustomBottomNavigationBar(newindex: 0,)
    );

    case HomeErrorState:
    return const Scaffold(
    body: Center(child: Text('Error')));
    default:
    return const SizedBox();
    }
    },
    );
    }
  }

