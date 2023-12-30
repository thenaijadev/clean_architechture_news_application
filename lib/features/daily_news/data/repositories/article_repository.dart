import 'package:clean_news_application/core/connection/network_info.dart';
import 'package:clean_news_application/core/constants/app_constants.dart';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/data/datasources/local/local_article_datasource.dart';
import 'package:clean_news_application/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_news_application/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService newsApiService;
  final ArticlesLocalDataSourceImpl localDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImplementation(
      {required this.newsApiService,
      required this.localDataSource,
      required this.networkInfo});
  @override
  FutureEitherArticleOrException getNewsArticles() async {
    if (await networkInfo.isConnected!) {
      final remoteArticle = await newsApiService.getNewsArticles(
          country: AppConstants.country, apiKey: AppConstants.apikey);
      localDataSource.saveArticle(remoteArticle);
      return remoteArticle;
    } else {
      final localArticles = await localDataSource.getSavedArticles();
      return localArticles;
    }
  }
}
