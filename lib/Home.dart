import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:iFix/utilis/applist.dart';
import 'package:iFix/utilis/code_list.dart';
import 'package:iFix/utilis/constants.dart';
import 'package:iFix/utilis/theme_changer.dart';
import 'itemlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myInterstitial..load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ThemeBuilder.of(context).ChangeTheme();
                        print('gg');
                      },
                      child: CircleAvatar(
                        child: Image.asset('assets/gear2.png'),
                        radius: 20.0,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' آیفیکس | iFix',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CircleAvatar(
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/ifixlogo.png',
                                              scale: 7,
                                            ),
                                            Text(
                                              'آیفیکس',
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('نسخه 1.0.0'),
                                            Text(
                                              'ترفندها,کدها و آموزش های مبایل!',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Text(
                                              'ساخته شده توسط فواد احمد (حمیدی)',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Text(
                                              ' واتساپ : 93744101458+',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Text(
                                              'ایمیل : fawadhamidy41@gmail.com',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Icon(Icons.info_outline)),
                        radius: 20.0,
                        foregroundColor: Colors.black38,
                        backgroundColor: Colors.white)
                  ],
                ),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 1,
                //       blurRadius: 5,
                //     ),
                //   ],
                // ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Image.asset('assets/pic.png', scale: 2.5),
                    SizedBox(
                      height: 14.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppList(Constants.applist),
                          ),
                        );
                      },
                      child: ReusableCard(
                          Icons.android,
                          'برنامه های پرکاربرد اندروید',
                          Colors.purple.shade900),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Itemlist1(
                                  Constants.trickesMenuItemlist,
                                  'ترفندهای مبایل')),
                        );
                      },
                      child: ReusableCard(Icons.phone_iphone, 'ترفندهای مبایل',
                          Colors.purple.shade900),
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (await myInterstitial.isLoaded()) {
                            myInterstitial
                              ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0,
                                horizontalCenterOffset: 0.0,
                              );
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Itemlist1(
                                      Constants.LearnMenuItemlist,
                                      'آموزش های مبایل')));
                        },
                        child: ReusableCard(Icons.phonelink_setup,
                            'آموزش های مبایل', Colors.purple.shade900)),
                    GestureDetector(
                        onTap: () async {
                          if (await myInterstitial.isLoaded()) {
                            myInterstitial
                              ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0,
                                horizontalCenterOffset: 0.0,
                              );
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Codelist(Constants.codelist)));
                        },
                        child: ReusableCard(Icons.mobile_screen_share,
                            'کدهای مخفی مبایل', Colors.purple.shade900)),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text(
                                      'بزودی...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0),
                                    ),
                                    content: Text(
                                        'در حال ساخت برنامه دیگری بخاطر به دسترس گذاشتن ترفند ها و آموزش های کامپیوتر برای شما هستیم!'),
                                  ));
                        },
                        child: ReusableCard(
                            Icons.desktop_windows,
                            'ترفند و آموزش های کامپیوتر',
                            Colors.purple.shade900)),
                    SizedBox(
                      height: 14.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  IconData icon;
  String text;
  Color iconcolor;

  ReusableCard(this.icon, this.text, this.iconcolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),

      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconcolor,
            size: 36.0,
          ),
          SizedBox(
            width: 14.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          )
        ],
      ),
      // height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-1532095516589065/9700685499',

  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
