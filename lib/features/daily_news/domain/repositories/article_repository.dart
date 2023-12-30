import 'package:clean_news_application/core/utils/typedef.dart';

abstract class ArticleRepository {
  FutureEitherArticleOrException getNewsArticles();
}
