import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(DarkModeStateFalse()) {
    on<ToggleDarkModeEvent>((event, emit) {
      final bool isDark = event.isDark;
      if (isDark) {
        emit(DarkModeStateTrue());
      } else {
        emit(DarkModeStateTrue());
      }
    });
  }
}
