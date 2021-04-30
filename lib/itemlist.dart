import 'package:flutter/material.dart';
import 'package:iFix/models/menu_item_model.dart';
import 'package:iFix/utilis/detail_page.dart';

class Itemlist1 extends StatefulWidget {
  final List<MenuItemModel> menuitemlist;
  final String title;

  Itemlist1(this.menuitemlist, this.title);

  @override
  _Itemlist1State createState() => _Itemlist1State();
}

class _Itemlist1State extends State<Itemlist1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.purple.shade900,
        elevation: 4.0,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: getList(),
    );
  }

  Widget getList() {
    return ListView.builder(
      itemCount: widget.menuitemlist.length,
      itemBuilder: (context, index) {
        return getlistile(widget.menuitemlist[index], context);
      },
    );
  }

  Widget getlistile(MenuItemModel menuItemModel, context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(menuItemModel, widget.title)));
      },
      // leading: Icon(
      //   Icons.arrow_forward_ios,
      // ),
      title: Text(
        menuItemModel.text,
      ),
      subtitle: Text('کلیک کنید'),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
