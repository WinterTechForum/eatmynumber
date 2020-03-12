import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/drawer-background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Eat My Number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createDrawerButton(BuildContext context,
      {IconData icon, String text}) {
    final storage = new FlutterSecureStorage();

    return ListTile(
      title: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            onPressed: () {
              storage.delete(key: "userToken").then((foo) {
                final nav = Navigator.of(context);
                nav.popAndPushNamed('/login');
              }
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.collections_bookmark, text: 'Home'),
          _createDrawerItem(icon: Icons.attach_money, text: 'Balance', onTap:() { Navigator.popAndPushNamed(context, "/balance"); }),
          _createDrawerButton(context, icon: Icons.delete, text: 'Delete token'),
        ],
      ),
    );
  }
}
