import 'package:clean_news_application/core/Models/article_error.dart';

class LocalDataSourceError extends ArticleError {
  LocalDataSourceError({required super.message});

  @override
  String toString() => 'LocalDataSourceError(message: $message)';
}
