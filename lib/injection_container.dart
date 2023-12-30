import 'package:clean_news_application/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_news_application/features/daily_news/data/repositories/article_repository.dart';
import 'package:clean_news_application/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_news_application/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:clean_news_application/features/daily_news/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<NewsApiService>(NewsApiServiceImplementation());
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImplementation(newsApiService: sl()));
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(articleRepository: sl()));
  sl.registerFactory<DailyNewsBloc>(() => DailyNewsBloc(sl()));
}
