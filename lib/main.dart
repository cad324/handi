import 'package:flutter/material.dart';
import 'login/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Handi',
      home: Login(),
    ),
  );
}
