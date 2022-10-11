import 'package:apiapi/provider/breakingnews_provider.dart';
import 'package:apiapi/provider/control_provider.dart';
import 'package:apiapi/provider/search_provider.dart';
import 'package:apiapi/provider/sports_provider.dart';
import 'package:apiapi/view/widgets/control_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ControlProvider()),
      ChangeNotifierProvider(create: (context) => BreakingNewsProvider(),lazy: true,),
      ChangeNotifierProvider(create: (context) => SearchProvider(),lazy: false),
      ChangeNotifierProvider(create: (context) => SportsProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlView(),
    );
  }
}
