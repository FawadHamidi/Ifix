import 'package:flutter/material.dart';
import 'package:iFix/utilis/theme_changer.dart';
import 'Home.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance
      .initialize(appId: 'ca-app-pub-1532095516589065~4894764147');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, _brightness) {
        print(_brightness);
        return (MaterialApp(
          title: 'Phone Tricks',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: _brightness),
          builder: (context, child) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Builder(
                  builder: (context) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child,
                    );
                  },
                ));
          },
          home: Home(),
        ));
      },
    );
  }
}
