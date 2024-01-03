// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dark_mode_bloc.dart';

abstract class DarkModeState extends Equatable {
  const DarkModeState();

  @override
  List<Object> get props => [];
}

class DarkModeCurrentState extends DarkModeState {
  final bool isDark;
  const DarkModeCurrentState({
    required this.isDark,
  });

  @override
  List<Object> get props => [isDark];
}
