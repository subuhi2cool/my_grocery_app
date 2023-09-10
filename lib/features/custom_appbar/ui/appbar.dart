import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/features/custom_appbar/bloc/custom_appbar_bloc.dart';
import 'package:my_grocery_app/features/login_form/ui/login_form.dart';

import '../../profile/ui/profile.dart';
import '../../search/ui/search.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({super.key, required this.title});

  final String title;
  final CustomAppbarBloc customAppbarBloc = CustomAppbarBloc();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomAppbarBloc, CustomAppbarState>(
      bloc: customAppbarBloc,
      listenWhen: (previous, current) =>current is CustomAppbarActionState,
      buildWhen: (previous, current) =>current is !CustomAppbarActionState,
      listener: (context, state) async {
        if(state is CustomAppbarNavigateToSearchPageActionState){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Search()));
        }
        else if(state is CustomAppbarNavigateToProfilePageActionState){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Profile()));
        }
        else if(state is CustomAppbarNavigateToSignOutPageActionState){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const LoginForm()));
            await FirebaseAuth.instance.signOut();
        }
      },
      builder: (context, state) {
        return AppBar(
          title: Text(title),
          actions: [
            IconButton(onPressed: () {
              customAppbarBloc.add(CustomAppbarSearchButtonNavigateEvent());
            }, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {
              customAppbarBloc.add(CustomAppbarProfileButtonNavigateEvent());
            }, icon: const Icon(Icons.person_pin)),
            IconButton(onPressed: () {
              customAppbarBloc.add(CustomAppbarSignOutButtonNavigateEvent());
            }, icon: const Icon(Icons.logout)),
          ],
        );
      },
    );
  }
}
