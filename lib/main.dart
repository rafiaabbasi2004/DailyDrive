import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kairiz3/Blogpost/Stayfocused.dart';
import 'package:kairiz3/Blogpost/blogpostmain.dart';
import 'package:kairiz3/Blogpost/priorotizetask.dart';
import 'package:kairiz3/Login/login.dart';
import 'package:kairiz3/MainLayout.dart';
import 'package:kairiz3/addingTAsk/addtaskscreen.dart';
import 'package:kairiz3/calender/calenderScreen.dart';
import 'Blogpost/Discovernewstrategies.dart';
import 'Blogpost/balance.dart';
import 'Register/register.dart';
import 'Splashscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //  colorScheme: ColorScheme.light(),
         // useMaterial3: true,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          )),
      initialRoute: '/',
      routes:{
        '/':(context)=>SplashScreen(),
        '/login':(context)=>LoginPage(),
        '/register':(context)=>RegisterPage(),
        '/main': (context)=>MainLayout(),
        '/calender':(context)=>CalendarScreen(),
        '/addTask': (context) => AddTaskScreen(),
        '/blogscreen': (context) => Blogscreen(),
        '/prioritize':(context)=>Prioritize(),
        '/discover':(context)=>DiscoverStrategies(),
        '/stayfocused':(context)=>StayFocused(),
        '/balance':(context)=>BalanceWorkLife(),
      },

    );
  }
}
