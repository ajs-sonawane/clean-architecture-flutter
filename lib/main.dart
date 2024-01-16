import 'dart:async';
import 'dart:math';
import 'package:clean_architecture_news_app_demo/config/theme/app_themes.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture_news_app_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        home: ConnectivityRecheck(),
      ),
    );
  }
}

class ConnectivityRecheck extends StatelessWidget {
  const ConnectivityRecheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.greenAccent,
                    child: Text("Check for internet connection.."),
                    onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   final _dataStreamController = StreamController<String>.broadcast();
//
//   Stream<String> get dataStream$ => _dataStreamController.stream;
//
//   addDataToStream(String data) => _dataStreamController.sink.add(data);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Builder(builder: (context) {
//                 return MaterialButton(
//                     color: Colors.redAccent,
//                     onPressed: () => _callApi(context),
//                     child: const Text("Tap"));
//               }),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   void _callApi(context) {
//     /// show bottomsheet
//     bloc();
//
//     Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
//       return Material(
//         color: Colors.greenAccent,
//         child: SizedBox(
//           height: 200,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               StreamBuilder(
//                   stream: dataStream$,
//                   builder:
//                       (BuildContext context, AsyncSnapshot<String> snapshot) {
//                     if (snapshot.hasData) {
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(snapshot.data.toString()),
//                             ],
//                           ),
//                         ],
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       return Text(snapshot.error.toString());
//                     }
//                     return const Center(child: CircularProgressIndicator());
//                   }),
//             ],
//           ),
//         ),
//       );
//     });
//   }
//
//   bloc() {
//     Future.delayed(const Duration(milliseconds: 1200), () {
//       var rng = Random();
//       addDataToStream(rng.nextInt(100).toString());
//     });
//   }
// }
