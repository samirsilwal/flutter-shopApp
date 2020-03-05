import 'package:flutter/material.dart';
import 'package:shopapp/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Navigate'),
            automaticallyImplyLeading: false,
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.shop,),
            title: Text('shop'),
            onTap: () { 
              Navigator.of(context).pushReplacementNamed('/');
            
            }
          ),
          ListTile(
            leading: Icon(Icons.payment,),
            title: Text('Orders'),
            onTap: () { 
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            
            }
          ),
        ],
      ),
    );
  }
}