part of 'daily_news_bloc.dart';

abstract class DailyNewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DailyArticleInitial extends DailyNewsState {}

class RemoteArticleLoading extends DailyNewsState {
  RemoteArticleLoading();
}

class RemoteArticleDone extends DailyNewsState {
  final NewsArticlesEntity articles;

  RemoteArticleDone({
    required this.articles,
  });
  @override
  List<Object> get props => [articles];
}

class RemoteArticleError extends DailyNewsState {
  final ArticleError serverError;

  RemoteArticleError({required this.serverError});
  @override
  List<Object> get props => [serverError];
}
