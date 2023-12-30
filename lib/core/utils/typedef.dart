import 'package:clean_news_application/core/Models/local_datasource_error.dart';
import 'package:clean_news_application/core/Models/remote_datasource_error.dart';
import 'package:clean_news_application/features/daily_news/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

typedef FutureEitherArticleOrException
    = Future<Either<RemoteDataSourseError, NewsArticlesEntity>>;

typedef EitherArticleOrException
    = Either<RemoteDataSourseError, NewsArticlesEntity>;

typedef EithertrueOrLocalDataSourceError
    = Future<Either<LocalDataSourceError, bool>>;
