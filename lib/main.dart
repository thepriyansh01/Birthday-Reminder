import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:birthdayapp/components/notification.dart';
import 'package:birthdayapp/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:birthdayapp/components/home_screen.dart';
import 'package:birthdayapp/components/theme_notifier.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    NotificationServices().initNotification();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return GetMaterialApp(
      title: 'Birthday Reminder',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const MyHomePage(),
    );
  }
}
