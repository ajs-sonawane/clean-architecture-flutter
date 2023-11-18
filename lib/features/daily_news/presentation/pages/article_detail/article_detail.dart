import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../injection_container.dart';

class ArticleDetailsView extends HookWidget {
  final ArticleEntity? article;

  const ArticleDetailsView(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticlesBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: Builder(
          builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onBackButtonTapped(context),
                child: const Icon(Icons.keyboard_backspace_rounded,
                    color: Colors.black87),
              )),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTileAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  _buildArticleTileAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title!,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.timeline, size: 16),
              Text(article!.publishedAt!, style: const TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
    );
  }

  _buildArticleImage() {
    return Container(
      height: 250,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(article!.urlToImage!, fit: BoxFit.cover),
    );
  }

  _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Text(
        article!.description ?? "",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  _onBackButtonTapped(BuildContext context) {
    Navigator.of(context).pop();
  }

  _buildFAB() {
    return Builder(builder: (context) {
      return FloatingActionButton(
        onPressed: () => _onFABPressed(context),
        child: Icon(Icons.bookmark_add),
      );
    });
  }

  _onFABPressed(BuildContext context) {
    BlocProvider.of<LocalArticlesBloc>(context).add(SaveArticle(article!));
    Scaffold.of(context).showBottomSheet(
        backgroundColor: Colors.black87,
        (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    "Article Saved Successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ),
            ));
  }
}
