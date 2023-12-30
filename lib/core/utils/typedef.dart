import 'package:clean_news_application/core/Models/article_error.dart';
import 'package:clean_news_application/features/daily_news/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

typedef FutureEitherArticleOrException
    = Future<Either<ArticleError, NewsArticlesEntity>>;

typedef EitherArticleOrException = Either<ArticleError, NewsArticlesEntity>;

typedef EithertrueOrLocalDataSourceError = Future<Either<ArticleError, bool>>;

typedef EitherArticleModelOrLocalDataSourceError
    = Future<Either<ArticleError, NewsArticlesEntity>>;
