import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lab3/ui/movie_list/movies_screen.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(DevicePreview(
      builder: (BuildContext context){
        return const MyApp();
      },
      enabled: kDebugMode,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: const MoviesScreen(title: 'Movies'),
    );
  }
}
