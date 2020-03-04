
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final String id;
  final double price;
  final double quantity;
  final String title;
  final Function ondismiss;

  const CartItem({ this.id, this.price, this.quantity, this.title, this.ondismiss});

  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      
    
       key: Key(id),
       onDismissed: (_) {
         ondismiss(id);
       },
       background: Container(
         color: Theme.of(context).primaryColor,
       ), 
          child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(padding: EdgeInsets.all(8),
        child:ListTile(
          leading: CircleAvatar(
            
            child:FittedBox(
              
              
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text('\$ $price'))
              ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$ ${price * quantity}'),
          trailing: Text('x$quantity'),
        ),
        ),
      ),
    );
  }
}