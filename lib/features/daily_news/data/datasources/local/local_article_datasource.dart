import 'dart:convert';

import 'package:clean_news_application/core/Models/local_datasource_error.dart';
import 'package:clean_news_application/core/utils/typedef.dart';
import 'package:clean_news_application/features/daily_news/data/models/article_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticlesLocalDataSource {
  EithertrueOrLocalDataSourceError saveArticle(
      EitherArticleOrException articles);

  EitherArticleModelOrLocalDataSourceError getSavedArticles();
}

const cachedPokemon = 'CACHED_POKEMON';

class ArticlesLocalDataSourceImpl implements ArticlesLocalDataSource {
  final Future<SharedPreferences> sharedPreferences;

  ArticlesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  EitherArticleModelOrLocalDataSourceError getSavedArticles() async {
    final preferences = await sharedPreferences;
    final jsonString = preferences.getString(cachedPokemon);

    if (jsonString != null) {
      final newsArticleModel = await Future.value(
          NewsArticlesModel.fromJson(json.decode(jsonString)));

      return right(newsArticleModel);
    } else {
      return left(LocalDataSourceError(
          message: "Unable to get locally saved articles"));
    }
  }

  @override
  EithertrueOrLocalDataSourceError saveArticle(
      EitherArticleOrException articles) async {
    // TODO:CHECK THIS LOGIC;
    final preferences = await sharedPreferences;

    articles.fold((l) {
      return left(LocalDataSourceError(
          message: "There has been an error saving articles locally"));
    }, (r) async {
      final isSaved = await preferences.setString(
        cachedPokemon,
        json.encode(
          r.toJson(),
        ),
      );
      return right(isSaved);
    });

    return left(LocalDataSourceError(
        message: "There has been an error saving articles locally"));
  }
}
