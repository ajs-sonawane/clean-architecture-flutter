import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/pages/saved_articles/saved_articles.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Daily News", style: TextStyle(color: Colors.black)),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SavedArticles()));
          },
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleError) {
        print("error ------- ${state.error}");
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              // print(state.articles);
              return GestureDetector(
                  onTap: () =>
                      _onArticlePressed(context, state.articles![index]),
                  child: ArticleTileWidget(article: state.articles![index]));
            });
      }
      return SizedBox();
    });
  }

  _onArticlePressed(BuildContext context, ArticleEntity articleEntity) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticleDetailsView(articleEntity)));
  }
}
