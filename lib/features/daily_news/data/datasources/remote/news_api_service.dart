import 'package:clean_news_application/core/Models/remote_datasource_error.dart';
import 'package:clean_news_application/core/network/api_endpoint.dart';
import 'package:clean_news_application/core/network/dio_client.dart';
import 'package:clean_news_application/core/network/dio_exception.dart';
import 'package:clean_news_application/core/utils/logger.dart';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/data/models/article_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class NewsApiService {
  FutureEitherArticleOrException getNewsArticles(
      {required String country, required String apiKey});
}

class NewsApiServiceImplementation implements NewsApiService {
  @override
  FutureEitherArticleOrException getNewsArticles(
      {required String country, required String apiKey}) async {
    try {
      final response = await DioClient.instance
          .get(RoutesAndPaths.everything, queryParameters: {
        "q": "france",
        "apiKey": "api_key",
      });

      return right(NewsArticlesModel.fromMap(response));
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioException(e).errorMessage;
      logger.e(e);
      return left(RemoteDataSourceError(message: errorMessage));
    } catch (e) {
      logger.e({"error": e.toString()});
      return left(RemoteDataSourceError(message: e.toString()));
    }
  }
}
