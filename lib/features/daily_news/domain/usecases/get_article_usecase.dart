import 'package:clean_news_application/core/usecase/usecase.dart';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_application/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase implements UseCase<NewsArticlesEntity, void> {
  final ArticleRepository articleRepository;

  GetArticleUseCase({required this.articleRepository});
  @override
  FutureEitherArticleOrException call({params}) {
    return articleRepository.getNewsArticles();
  }
}
