import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/view/screen/home/home.dart';

main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Furniture",
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: AppConstantsColor.backgroundColor),
            useMaterial3: true),
        home: const Home(),
      ),
    );
