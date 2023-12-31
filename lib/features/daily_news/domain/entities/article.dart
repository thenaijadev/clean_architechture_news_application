// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:clean_news_application/features/daily_news/data/models/unit_article.dart';
import 'package:equatable/equatable.dart';

class NewsArticlesEntity extends Equatable {
  final String status;

  final int totalResults;

  final List<Article> articles;

  const NewsArticlesEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object?> get props => [status, totalResults, articles];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
