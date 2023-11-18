import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/widgets/saved_article_widget.dart';
import 'package:clean_architecture_news_app_demo/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticlesBloc>()..add(const GetSavedArticles()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      title:
          const Text("Saved Articles", style: TextStyle(color: Colors.black87)),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<LocalArticlesBloc, LocalArticleState>(
        builder: (context, state) {
      if (state is LocalArticlesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is LocalArticlesDone) {
        return _buildArticlesList(state.articles!);
      }
      return SizedBox();
    });
  }

  _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child:
            Text("NO SAVED ARTICLES", style: TextStyle(color: Colors.black87)),
      );
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, int i) {
          return SavedArticleWidget(
            article: articles[i],
            onRemoveArticle: () => _onRemoveArticle(context, articles[i]),
          );
        });
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticlesBloc>(context).add(RemoveArticle(article));
  }
}
