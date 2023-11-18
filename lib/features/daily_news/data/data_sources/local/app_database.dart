import 'package:clean_architecture_news_app_demo/features/daily_news/data/data_sources/local/DAO/article_dao.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
