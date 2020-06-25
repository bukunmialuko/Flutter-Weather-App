import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterweatherapp/styles.dart';
import 'package:flutterweatherapp/utils/app_settings.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
