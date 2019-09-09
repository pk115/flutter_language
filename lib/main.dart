import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

import 'default_language.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //app-specific localization
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'resources/langs',
            //useOnlyLangCode: true,
            // loadPath: 'https://raw.githubusercontent.com/aissat/easy_localization/master/example/resources/langs'
          ),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('th', 'TH')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Easy localization'),
      ),
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
  int counter = 0;
  incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).tr('title')),
          actions: <Widget>[
            FlatButton(
              child: Text("English"),
              color: Localizations.localeOf(context).languageCode == "en"
                  ? Colors.lightBlueAccent
                  : Colors.blue,
              onPressed: () {
                this.setState(() {
                  data.changeLocale(Locale("en", "US"));
                  print(Localizations.localeOf(context).languageCode);
                });
              },
            ),
            FlatButton(
              child: Text("ไทย"),
              color: Localizations.localeOf(context).languageCode == "th"
                  ? Colors.lightBlueAccent
                  : Colors.blue,
              onPressed: () {
                this.setState(() {
                  data.changeLocale(Locale("th", "TH"));
                  print(Localizations.localeOf(context).languageCode);
                });
              },
            )
          ],
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(AppLocalizations.of(context)
                  .tr('msg', args: ['aissat', 'Flutter'])),
              new Text(AppLocalizations.of(context).plural('clicked', counter)),
              new FlatButton(
                onPressed: () async {
                  incrementCounter();
                },
                child: new Text(AppLocalizations.of(context).tr('clickMe')),
              ),
              new Text(
                AppLocalizations.of(context).tr('profile.reset_password.title'),
              ),
              RaisedButton(
                onPressed: () => {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => DefaultPage()))

                },
                color: Colors.deepPurpleAccent,
                child: Text("Default FlutterPage",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementCounter,
          child: Text('+1'),
        ),
      ),
    );
  }
}