import 'dart:developer';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'dio_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                final Response response = await DioUtils.instance.dioClient
                    .get('https://jsonplaceholder.typicode.com/users');
                DioUtils.instance.close();
                List<dynamic> data = response.data;
                for (var element in data) {
                  log(element.toString());
                }
              } on DioException catch (e) {
                log(e.type.toString());
              }
            },
            child: const Text('Call Api'),
          ),
        ),
      ),
    );
  }
}
