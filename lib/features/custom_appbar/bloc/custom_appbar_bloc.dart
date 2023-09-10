import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_appbar_event.dart';
part 'custom_appbar_state.dart';

class CustomAppbarBloc extends Bloc<CustomAppbarEvent, CustomAppbarState> {
  CustomAppbarBloc() : super(CustomAppbarInitial()) {
    on<CustomAppbarEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CustomAppbarSearchButtonNavigateEvent>(customAppbarSearchButtonNavigateEvent);
    on<CustomAppbarProfileButtonNavigateEvent>(customAppbarProfileButtonNavigateEvent);
    on<CustomAppbarSignOutButtonNavigateEvent>(customAppbarSignOutButtonNavigateEvent);
  }

  FutureOr<void> customAppbarSearchButtonNavigateEvent(CustomAppbarSearchButtonNavigateEvent event, Emitter<CustomAppbarState> emit) {
      emit(CustomAppbarNavigateToSearchPageActionState());
  }

  FutureOr<void> customAppbarProfileButtonNavigateEvent(CustomAppbarProfileButtonNavigateEvent event, Emitter<CustomAppbarState> emit) {
    emit(CustomAppbarNavigateToProfilePageActionState());
  }

  FutureOr<void> customAppbarSignOutButtonNavigateEvent(CustomAppbarSignOutButtonNavigateEvent event, Emitter<CustomAppbarState> emit) {
    emit(CustomAppbarNavigateToSignOutPageActionState());
  }
}
