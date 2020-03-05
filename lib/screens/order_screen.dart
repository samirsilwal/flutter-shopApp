
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' ;
import 'package:shopapp/providers/order.dart' show Orders;
import 'package:shopapp/widgets/drawer.dart';
import '../widgets/order_item.dart';



class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title:Text('Your Orders')
      ),

      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index){
            return OrderItem(orderItem: orderData.orders[index]);
        }
        ),
    );
  }
}