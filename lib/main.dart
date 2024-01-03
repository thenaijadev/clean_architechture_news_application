import 'package:clean_news_application/config/router/app_router.dart';
import 'package:clean_news_application/config/theme/dark_theme.dart';
import 'package:clean_news_application/config/theme/light_theme.dart';
import 'package:clean_news_application/core/connection/network_info.dart';
import 'package:clean_news_application/features/daily_news/data/datasources/local/local_article_datasource.dart';
import 'package:clean_news_application/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_news_application/features/daily_news/data/repositories/article_repository.dart';
import 'package:clean_news_application/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:clean_news_application/features/daily_news/presentation/bloc/bloc.dart';
import 'package:clean_news_application/features/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';

void main() async {
  appInitialization();
  runApp(const MyApp());
}

appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // SuperBaseProviderImpl().superBaseInit();
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DailyNewsBloc>(
            create: (context) => DailyNewsBloc(
              GetArticleUseCase(
                articleRepository: ArticleRepositoryImplementation(
                  newsApiService: NewsApiServiceImplementation(),
                  localDataSource: ArticlesLocalDataSourceImpl(
                    sharedPreferences: SharedPreferences.getInstance(),
                  ),
                  networkInfo: NetworkInfoImpl(
                    connectionChecker: DataConnectionChecker(),
                  ),
                ),
              ),
            )..add(GetArticlesEvent()),
          ),
          BlocProvider(
            create: (context) => DarkModeBloc(),
          ),
        ],
        child: BlocBuilder<DarkModeBloc, DarkModeState>(
          builder: (context, state) {
            if (state is DarkModeCurrentState) {
              return MaterialApp(
                theme: state.isDark ? darkTheme() : lightTheme(),
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                initialRoute: "/",
                onGenerateRoute: appRouter.onGenerateRoute,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
