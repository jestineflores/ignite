import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ignite/dataproviders/appdata.dart';
import 'package:ignite/screens/login_page.dart';
import 'package:ignite/screens/registration_page.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import './screens/mainpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS
        ? FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyDcde2D-wrIZbd6rUnG4Yli0KspVvJ-fJ0',
            projectId: 'ignite-420',
            messagingSenderId: '559961107838',
            databaseURL: 'https://ignite-420.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:559961107838:android:17d96d8ae5ee402dfc172f',
            apiKey: 'AIzaSyBPXBAC60Xg1sqGg04tS4yFH5qSajx5VyE',
            messagingSenderId: '559961107838',
            projectId: 'ignite-420',
            databaseURL: 'https://ignite-420.firebaseio.com',
          ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Ignite',
        theme: ThemeData(
          fontFamily: "Brand-Regular",
          // primarySwatch: Colors.green[800],
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RegistrationPage.id,
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage(),
        },
      ),
    );
  }
}
