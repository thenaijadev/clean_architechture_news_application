// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
import 'dart:convert';

import 'package:clean_news_application/features/daily_news/data/models/unit_article.dart';
import 'package:clean_news_application/features/daily_news/domain/entities/article.dart';

class NewsArticlesModel extends NewsArticlesEntity {
  @override
  final String status;
  @override
  final int totalResults;
  @override
  final List<Article> articles;
  const NewsArticlesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  }) : super(status: status, totalResults: totalResults, articles: articles);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsArticlesModel.fromMap(Map<String, dynamic> map) {
    return NewsArticlesModel(
      status: (map['status'] ?? ''),
      totalResults: (map['totalResults'] ?? 0),
      articles: List<Article>.from(
        (map['articles']).map<Article>(
          (x) => Article.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsArticlesModel.fromJson(source) =>
      NewsArticlesModel.fromMap(json.decode(source));
}
