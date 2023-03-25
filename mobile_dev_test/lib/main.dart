import 'package:flutter/material.dart';
import 'app/injection_container.dart' as di;
import 'app/app.dart';

void main() async {
  await di.init(" https://www.themealdb.com/api/json/v1/1/");
  runApp(const MyApp());
}
