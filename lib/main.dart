import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:test_cupertino/features/auth/auth_screen.dart';

import 'core/common/utils/hive/hive_init.dart';

Future<void> main() async {
  await Hive.initFlutter();
  initHiveAdapters();
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveBoxes();
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Box accessBox = Hive.box('access');
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
