// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_news_application/core/Models/article_error.dart';

class RemoteDataSourceError extends ArticleError {
  RemoteDataSourceError({required super.message});

  @override
  String toString() => 'RemoteDataSourseError(message: $message)';
}
