import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/themes.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(AppTheme.lightTheme)) {
    on<ToggleToLight>((event, emit) {
      emit(ThemeState(AppTheme.lightTheme));
    });
    on<ToggleToDark>((event, emit) {
      emit(ThemeState(AppTheme.darkTheme));
    });
  }
}
