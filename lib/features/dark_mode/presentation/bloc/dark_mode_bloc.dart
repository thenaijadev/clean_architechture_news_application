import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(const DarkModeCurrentState(isDark: true)) {
    on<ToggleDarkModeEvent>((event, emit) {
      final bool isDark = event.isDark;
      emit(DarkModeCurrentState(isDark: isDark));
    });
  }
}
