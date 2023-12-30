import 'dart:convert';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/data/models/article_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticlesLocalDataSource {
  Future<void>? saveArticle(NewsArticlesModel? articles);

  Future<NewsArticlesModel> getSavedArticles();
}

const cachedPokemon = 'CACHED_POKEMON';

class ArticlesLocalDataSourceImpl implements ArticlesLocalDataSource {
  final SharedPreferences sharedPreferences;

  ArticlesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NewsArticlesModel> getSavedArticles() {
    final jsonString = sharedPreferences.getString(cachedPokemon);

    if (jsonString != null) {
      return Future.value(NewsArticlesModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  EithertrueOrLocalDataSourceError saveArticle(NewsArticlesModel? articles) async{
    if (articles != null) {
    final isSaved =  await sharedPreferences.setString(
        cachedPokemon,
        json.encode(
          articles.toJson(),
        ),
      );
      return right(
        isSaved
      )
    } else {
      throw CacheException();
    }
  }
}
