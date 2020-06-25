import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterweatherapp/pages/page_container.dart';
import 'package:flutterweatherapp/styles.dart';
import 'models/src/app_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSettings settings = AppSettings();

  // Don't allow landscape mode
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp(settings: settings)));
}

class MyApp extends StatelessWidget {
  final AppSettings settings;

  const MyApp({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
    );

  return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: PageContainer(settings: settings),
    );
  }
}
