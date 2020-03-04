import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class ProductsItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,);
    final cart = Provider.of<Cart>(context, listen: false);

    
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: GridTile(
        
        child: GestureDetector(
              onTap:(){
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments:product.id);
              } ,
              child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon( (product.isFavourite) ? Icons.favorite: Icons.favorite_border),
            onPressed: (){
              product.toggleIsFav();
            },
            color: Theme.of(context).primaryColor,
            ),
          title:Text(product.title, textAlign: TextAlign.center,),
          backgroundColor: Colors.grey.withOpacity(0.8),  
          trailing: IconButton(
            icon: Icon(Icons. shopping_cart),
             onPressed: (){
            cart.addNewItemToCart(product.id, product.title, product.price);
          },
          color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}