import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maggood/layout.dart';
import 'package:maggood/viewmodels/providers/booklet_provider.dart';
import 'package:maggood/viewmodels/providers/dashboard_provider.dart';
import 'package:maggood/viewmodels/providers/layout_provider.dart';
import 'package:maggood/viewmodels/providers/statistics_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LayoutProvider()),
        ChangeNotifierProvider(create: (context) => StatisticsProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => BookletProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Plus Jakarta Sans',
        ),
        home: const Layout(),
      ),
    );
  }
}
