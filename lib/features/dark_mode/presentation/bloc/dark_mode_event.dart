part of 'dark_mode_bloc.dart';

abstract class DarkModeEvent extends Equatable {
  const DarkModeEvent();

  @override
  List<Object> get props => [];
}

class ToggleDarkModeEvent extends DarkModeEvent {
  final bool isDark;
  const ToggleDarkModeEvent({this.isDark = false});
}
