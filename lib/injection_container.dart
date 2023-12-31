// import 'package:clean_news_application/core/connection/network_info.dart';
// import 'package:clean_news_application/features/daily_news/data/datasources/local/local_article_datasource.dart';
// import 'package:clean_news_application/features/daily_news/data/datasources/remote/news_api_service.dart';
// import 'package:clean_news_application/features/daily_news/data/repositories/article_repository.dart';
// import 'package:clean_news_application/features/daily_news/domain/repositories/article_repository.dart';
// import 'package:clean_news_application/features/daily_news/domain/usecases/get_article_usecase.dart';
// import 'package:clean_news_application/features/daily_news/presentation/bloc/bloc.dart';
// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final sl = GetIt.instance;

// Future<void> initializeDependencies() async {
//   sl.registerSingleton<NewsApiService>(NewsApiServiceImplementation());
//   sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());

//   sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
//   sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(sl()));
//   // sl.registerSingleton<SharedPreferences>(SharedPreferences());

//   sl.registerSingleton<ArticlesLocalDataSource>(ArticlesLocalDataSourceImpl(
//       sharedPreferences: await SharedPreferences.getInstance()));

//   sl.registerSingleton<ArticleRepository>(ArticleRepositoryImplementation(
//       newsApiService: sl(), localDataSource: sl(), networkInfo: sl()));
//   sl.registerSingleton<GetArticleUseCase>(
//       GetArticleUseCase(articleRepository: sl()));
//   sl.registerFactory<DailyNewsBloc>(() => DailyNewsBloc(sl()));
// }
