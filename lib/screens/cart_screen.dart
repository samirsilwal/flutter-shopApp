import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart' show Cart;
import 'package:shopapp/providers/order.dart';
import 'package:shopapp/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {  
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Your Cart'),
        
        ),
        body: Column(
          children:<Widget> [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Text('Total',
                    style: TextStyle(
                        fontSize: 20,
                    ),
                    ),
                    Spacer(),
                    SizedBox(width: 10,),
                    Chip(label: Text('\$ ${cart.totalAmount.toStringAsPrecision(4)}', style: TextStyle(
                      color: Colors.white
                    ),),
                    backgroundColor: Theme.of(context).primaryColor,
                    ),

                    FlatButton(onPressed: (){
                      Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);

                      cart.remove();
                    }, child: Text('OrderNow',style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),),)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: cart.getItemsCount ,
                itemBuilder: (context, index){
                  return CartItem(
                    id:cart.items.values.toList()[index].id,
                    title: cart.items.values.toList()[index].id,
                    quantity: cart.items.values.toList()[index].quantity,
                    price: cart.items.values.toList()[index].price,
                    ondismiss: cart.removeItem,
                  );
                },
              )
              )
          ],


        ),
    );
  }
}