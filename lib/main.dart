import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flow_plus/constants/data_constants.dart';
import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/data_streams.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/services/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory hiveDir = await getTemporaryDirectory();
  Hive.init(hiveDir.path.toString());
  await Hive.openBox(HiveConstants.boxName);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserOrBusinessProvider>(
          create: (context) => UserOrBusinessProvider()..assignUser(null),
          lazy: true,
        ),
        StreamProvider<List<BusinessDetailsModel>>(
          create: (context) => DataStreams.getBusinesses(),
          initialData: const [],
          lazy: true,
        ),
        Provider<List<Map>>(
          create: (context) => typeOfBusiness,
        )
      ],
      child: GetMaterialApp(
        title: 'Flow Plus',
        theme: ThemeData(
          // Define the default brightness and colors.
          //brightness: Brightness.dark,
          //primaryColor: Colors.lightBlue[800],
          primaryColor: Colors.blueAccent.shade700,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
            secondary: Colors.blueGrey.shade100,
          ),
          //scaffoldBackgroundColor: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey.shade200),
          // Define the default font family.
          //fontFamily: 'Georgia',
          fontFamily: "Roboto",

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
            headline4: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            headline5: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
            bodyText1: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Hind',
                fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
            //bodyMedium: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal)
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
