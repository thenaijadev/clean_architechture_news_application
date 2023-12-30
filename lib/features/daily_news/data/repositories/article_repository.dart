import 'package:clean_news_application/core/constants/app_constants.dart';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_news_application/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService newsApiService;

  ArticleRepositoryImplementation({required this.newsApiService});
  @override
  FutureEitherArticleOrException getNewsArticles() {
    return newsApiService.getNewsArticles(
        country: AppConstants.country, apiKey: AppConstants.apikey);
  }
}
