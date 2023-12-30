import 'package:animate_do/animate_do.dart';
import 'package:clean_news_application/core/widgets/snackbar.dart';
import 'package:clean_news_application/core/widgets/text_widget.dart';
import 'package:clean_news_application/features/daily_news/presentation/bloc/daily_news_bloc.dart';
import 'package:clean_news_application/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "Daily News"),
      ),
      body: BlocListener<DailyNewsBloc, DailyNewsState>(
        listener: (context, state) {
          if (state is RemoteArticleError) {
            InfoSnackBar.showErrorSnackBar(context, state.serverError.message);
          }
        },
        child: BlocBuilder<DailyNewsBloc, DailyNewsState>(
          builder: (context, state) {
            if (state is RemoteArticleLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is RemoteArticleError) {
              return const Center(
                child: Icon(Icons.refresh),
              );
            }
            if (state is RemoteArticleDone) {
              return ListView.builder(
                  itemCount: (state.articles.articles.length),
                  itemBuilder: (context, index) {
                    return FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      child: ArticleWidget(
                          article: state.articles.articles[index]),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
