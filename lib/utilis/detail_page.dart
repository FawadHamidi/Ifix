import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:iFix/models/item.dart';
import 'package:iFix/models/menu_item_model.dart';

class DetailPage extends StatefulWidget {
  MenuItemModel menuItemModel;
  final String tit;

  DetailPage(this.menuItemModel, this.tit);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
          title: Text(widget.tit),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 100.0),
          itemCount: widget.menuItemModel.itemslist.length,
          itemBuilder: (context, index) {
            return getlayout(widget.menuItemModel.itemslist[index]);
          },
        ));
  }

  Widget getlayout(ItemModel itemModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 14.0),
      child: Column(
        children: [
          itemModel.title == null
              ? Container()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: Text(
                    itemModel.title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
          itemModel.image == null
              ? Container()
              : Container(
                  height: 200.0,
                  color: Colors.blueAccent,
                  child: Image.asset(itemModel.image)),
          itemModel.text == null
              ? Container()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: Text(
                    itemModel.text,
                    textDirection: TextDirection.rtl,
                  )),
        ],
      ),
    );
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
