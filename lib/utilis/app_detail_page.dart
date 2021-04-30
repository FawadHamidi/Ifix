import 'package:flutter/material.dart';
import 'package:iFix/models/app_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_admob/firebase_admob.dart';

class AppDetailPage extends StatefulWidget {
  AppModel appModel;

  AppDetailPage(this.appModel);

  @override
  _AppDetailPageState createState() => _AppDetailPageState();
}

class _AppDetailPageState extends State<AppDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _showBanner();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.purple.shade900,
        title: Text('برنامه های پرکاربرد اندروید'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 100.0),
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 80,
            child: Image(image: AssetImage(widget.appModel.appimage)),
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Text(widget.appModel.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10,
          ),
          Text(widget.appModel.desc,
              style: TextStyle(
                fontSize: 15.0,
              )),
          RaisedButton(
            child: Text(
              'لینک دانلود',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.green,
            onPressed: () {
              _launchUR(widget.appModel);
            },
          ),
        ],
      ),
    );
  }

  _launchUR(AppModel linkmodel) async {
    String url = linkmodel.link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-1532095516589065/4273276607',
    size: AdSize.smartBanner,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  void _showBanner() async {
    myBanner
      ..load().then((value) async {
        print(value);
        if (value && mounted) {
          print("loaded ${await myBanner.isLoaded()}");
          myBanner.show(
            anchorOffset: 0.0,
            horizontalCenterOffset: 0.0,
            anchorType: AnchorType.bottom,
          );
        }
      });
  }
}
