import 'package:bloc/bloc.dart';
import 'package:clean_news_application/core/Models/article_error.dart';
import 'package:clean_news_application/core/Models/remote_datasource_error.dart';
import 'package:clean_news_application/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_application/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:equatable/equatable.dart';

part 'daily_news_event.dart';
part 'daily_news_state.dart';

class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  final GetArticleUseCase getArticleUseCase;
  DailyNewsBloc(this.getArticleUseCase) : super(DailyArticleInitial()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  void onGetArticles(event, emit) async {
    emit(RemoteArticleLoading());

    final response = await getArticleUseCase.call();

    response.fold((l) {
      emit(RemoteArticleError(serverError: l));
    }, (r) {
      if (r.articles.isEmpty) {
        emit(RemoteArticleError(
            serverError:
                RemoteDataSourseError(message: "No Articles to be shown")));
      } else {
        emit(RemoteArticleDone(articles: r));
      }
    });
  }
}
