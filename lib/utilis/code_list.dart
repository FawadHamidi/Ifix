import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:iFix/models/code_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';

class Codelist extends StatefulWidget {
  List<CodeModel> codelist;

  Codelist(this.codelist);

  @override
  _CodelistState createState() => _CodelistState();
}

class _CodelistState extends State<Codelist> {
  @override
  void initState() {
    myInterstitial..load();
    super.initState();
  }

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.purple.shade900,
        elevation: 4.0,
        title: Text(
          'کدهای مخفی مبایل',
          style: TextStyle(),
        ),
      ),
      body: getCodelist(),
    );
  }

  Widget getCodelist() {
    return ListView.builder(
        itemCount: widget.codelist.length,
        itemBuilder: (context, index) {
          return getcodetile(widget.codelist[index], context);
        });
  }

  Widget getcodetile(CodeModel codeModel, context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () async {
          if (await myInterstitial.isLoaded()) {
            myInterstitial
              ..show(
                anchorType: AnchorType.bottom,
                anchorOffset: 0.0,
                horizontalCenterOffset: 0.0,
              );
          }
          if (codeModel.text == "") {
            print('enter text');
          } else {
            print(codeModel.text);
            FlutterClipboard.copy(codeModel.text);
          }
        },
        child: Icon(
          Icons.content_copy,
        ),
      ),
      title: Text(
        codeModel.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      subtitle: Text(
        codeModel.code,
        textAlign: TextAlign.center,
      ),
      trailing: GestureDetector(
          onTap: () {
            _launchUR(codeModel);
          },
          child: Icon(Icons.call)),
    );
  }

  _launchUR(CodeModel nummodel) async {
    String encoded = Uri.encodeComponent(nummodel.text);
    String url = "tel:$encoded";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
}
