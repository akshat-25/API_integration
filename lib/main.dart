import 'package:api_inergration/pages/homepage.dart';
import 'package:api_inergration/pages/homepagethree.dart';
import 'package:api_inergration/pages/homepagetwo.dart';
import 'package:api_inergration/pages/sign_up_page.dart';
import 'package:api_inergration/pages/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadImage(),
    );
  }
}
