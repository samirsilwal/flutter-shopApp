import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/widgets/badge.dart';
import 'package:shopapp/widgets/products_grid.dart';


enum FilterOption {
  FAVOURITES,
  ALL
}

class ProductsOverviewScreen extends StatefulWidget {

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  var _showOnlyFav = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title:Text('My shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOption selval) {
                setState(() {
                  if(selval == FilterOption.FAVOURITES){
                  _showOnlyFav = true;
                }else{
                    _showOnlyFav =false;
                } 
                });
              } ,
              itemBuilder:(_) {
              return [
                PopupMenuItem(child: Text('show fav'), value:FilterOption.FAVOURITES),
                PopupMenuItem(child: Text('show all'), value:FilterOption.ALL),

              ];
            } ,
             icon: Icon(Icons.more_vert),
             ),

             Consumer<Cart>(
               builder: (context,cart, child ){
                 return BadgeButton(
                   icon: Icons.shopping_cart,
                    text: cart.getItemsCount.toString(),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                     );
                  },
               ),
          ],
        ),
        body: ProductsGrid(_showOnlyFav),
         
    );
  }
}


