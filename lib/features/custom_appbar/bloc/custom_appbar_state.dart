part of 'custom_appbar_bloc.dart';

@immutable
abstract class CustomAppbarState {}

abstract class CustomAppbarActionState extends CustomAppbarState {}

class CustomAppbarInitial extends CustomAppbarState {}

class CustomAppbarNavigateToSearchPageActionState extends CustomAppbarActionState {}

class CustomAppbarNavigateToProfilePageActionState extends CustomAppbarActionState {}

class CustomAppbarNavigateToSignOutPageActionState extends CustomAppbarActionState {}

