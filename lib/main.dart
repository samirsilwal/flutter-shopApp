import 'package:flutter/material.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/order.dart';
import 'package:shopapp/providers/products..dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/order_screen.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
            ChangeNotifierProvider(
              create:(context) => Products(),
            ),
            ChangeNotifierProvider(
              create:(context) => Cart(),
            ),
            ChangeNotifierProvider.value(
              value: Orders() ,
            ),
          ],
         
          child: MaterialApp(
            
            debugShowCheckedModeBanner: false,
          
        routes: {
          ProductDetailScreen.routeName : (context) => ProductDetailScreen(),
          CartScreen.routeName : (context) => CartScreen(),
          OrderScreen.routeName : (context) => OrderScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(      
          primarySwatch: Colors.purple,
          accentColor: Colors.black
        ),
        home: ProductsOverviewScreen(),
      ),
    );
  }
}

class MyShop extends StatefulWidget {
  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myshop'),
      ),
      body:Center(
        child:Text('demo'),
      ),
    );
  }
}
