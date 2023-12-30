part of 'daily_news_bloc.dart';

abstract class DailyNewsEvent extends Equatable {
  const DailyNewsEvent();

  @override
  List<Object> get props => [];
}

class GetArticlesEvent extends DailyNewsEvent {}
