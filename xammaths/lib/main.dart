import 'package:flutter/material.dart';
import 'package:xammaths/Logins@reg/login.dart';

import 'package:xammaths/Logins@reg/register.dart';
import 'package:xammaths/home.dart';
import 'userpages/doubtpage.dart';
import 'package:xammaths/userpages/pastquestions.dart';
import 'package:xammaths/userpages/revision.dart';

import 'userpages/camera_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraUtils.initializeCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xam Maths',
      home: const Loginpage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/register': (context) => const registerPage(),
        '/doubtpage': (context) => const DoubtPage(),
        '/pastquestions': (context) => const PastQuestions(),
        '/revision': (context) => const RevisionPage()
      },
    );
  }
}
