import 'package:animate_do/animate_do.dart';
import 'package:clean_news_application/core/widgets/snackbar.dart';
import 'package:clean_news_application/core/widgets/text_widget.dart';
import 'package:clean_news_application/features/daily_news/presentation/bloc/daily_news_bloc.dart';
import 'package:clean_news_application/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:clean_news_application/features/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
            text: "Daily News", color: Theme.of(context).colorScheme.primary),
        centerTitle: false,
        actions: [
          Transform.scale(
            scale: .8,
            child: BlocBuilder<DarkModeBloc, DarkModeState>(
                builder: (context, state) {
              return state is DarkModeCurrentState
                  ? Switch(
                      activeColor: Colors.black,
                      activeThumbImage: const AssetImage("images/moon.png"),
                      inactiveThumbImage: const AssetImage("images/sun.png"),
                      activeTrackColor: const Color.fromARGB(255, 20, 20, 20),
                      value: state.isDark,
                      onChanged: (value) {
                        context
                            .read<DarkModeBloc>()
                            .add(ToggleDarkModeEvent(isDark: !state.isDark));
                      },
                    )
                  : const SizedBox();
            }),
          )
        ],
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
