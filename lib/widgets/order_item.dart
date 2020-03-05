
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem orderItem;

  const OrderItem({this.orderItem});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  var _isExpanded =false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$ ${widget.orderItem.amount.toStringAsFixed(4)}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.orderItem.dateTime).toString()
              ),
              trailing: IconButton(icon: _isExpanded ?  Icon(Icons.expand_less):Icon(Icons.expand_more), onPressed: (){
                setState(() {
                  _isExpanded = !_isExpanded;
                });

              }),
          ),
          if(_isExpanded) Container(
            padding: EdgeInsets.all(8),
            height: min(widget.orderItem.products.length * 20.0 + 80, 180),
            child: ListView(
              children: widget.orderItem.products.map(
                (item){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),

                      Text('${item.quantity}x \$ ${item.price}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      )
                    ],
                  );
                }
              ).toList()
            ),
          ),
            
        ],
      ),
    );
  }
}