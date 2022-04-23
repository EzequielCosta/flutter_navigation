import 'package:flutter/material.dart';
import 'package:navigation_detail/pages/detail/detail_page.dart';
import 'package:navigation_detail/pages/home/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Home',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/detail": (context) => const DetailPage()
      },
    );
  }
}
