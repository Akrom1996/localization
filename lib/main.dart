import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('uz', 'UZ'),
      Locale('ru', 'RU'),
      Locale('fr', 'FR'),
      Locale('kr', 'KR'),
      Locale('jp', 'JP')
    ],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Localization"),
      //   centerTitle: true,
      // ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                // color: Colors.amber,
                height: 100,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'welcome',
                    style: TextStyle(fontSize: 20),
                  ).tr(),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        context.locale = Locale("en", "US");
                      },
                      child: Text("English"),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        context.locale = Locale("kr", "KR");
                      },
                      child: Text("Korean"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        context.locale = Locale("jp", "JP");
                      },
                      child: Text("Japanese"),
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(primary: Colors.red),
                    //   onPressed: () {
                    //     context.locale = Locale("ru", "RU");
                    //   },
                    //   child: Text("Russian"),
                    // ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(primary: Colors.blue),
                    //   onPressed: () {
                    //     context.locale = Locale("uz", "UZ");
                    //   },
                    //   child: Text("Uzbek"),
                    // ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(primary: Colors.amber),
                    //   onPressed: () {
                    //     context.locale = Locale("fr", "FR");
                    //   },
                    //   child: Text("French"),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
