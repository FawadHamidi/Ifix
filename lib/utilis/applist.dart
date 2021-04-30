import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'package:iFix/models/app_model.dart';
import 'package:iFix/utilis/app_detail_page.dart';
import 'package:iFix/utilis/constants.dart';

class AppList extends StatefulWidget {
  List<AppModel> applist;

  AppList(this.applist);

  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
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
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.purple.shade900,
        elevation: 4.0,
        title: Text(
          'برنامه های پرکاربرد اندروید',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: getAppList(),
    );
  }

  Widget getAppList() {
    return ListView.builder(
        itemCount: widget.applist.length,
        itemBuilder: (context, index) {
          return getAppTile(widget.applist[index], context);
        });
  }

  Widget getAppTile(AppModel appModel, context) {
    return GestureDetector(
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
          MaterialPageRoute(builder: (context) => AppDetailPage(appModel)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        height: 60.0,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(appModel.appimage),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                appModel.appname,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
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
      ),
    );
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
}
