import 'package:clean_architecture_news_app_demo/config/theme/app_themes.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture_news_app_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily News',
        theme: theme(),
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: const DailyNews(),
      ),
    );
  }
}
