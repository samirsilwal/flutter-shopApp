import 'package:flutter/material.dart';
import 'package:shopapp/providers/product.dart';


class Products with ChangeNotifier{

   final List<Product> _items = [
              Product(
              id: 'p1',
              title: 'Product 1',
              description: 'Product 1 description',
              price: 9.99,
              imageUrl:
                  'https://picsum.photos/id/50/200/300',
            ),
            Product(
              id: 'p2',
              title: 'Product 2',
              description: 'Product 2 description',
              price: 19.99,
              imageUrl: 'https://picsum.photos/id/1/200/300',
            ),
            Product(
              id: 'p3',
              title: 'Product 3',
              description: 'Product 3 description',
              price: 29.99,
              imageUrl: 'https://picsum.photos/id/32/200/300',
            ),
            Product(
              id: 'p4',
              title: 'Product 4',
              description: 'Product 4 description',
              price: 39.99,
              imageUrl: 'https://picsum.photos/id/13/200/300',
            ),
            Product(
              id: 'p5',
              title: 'Product 5',
              description: 'Product 5 description',
              price: 49.99,
              imageUrl: 'https://picsum.photos/id/14/200/300',
            ),
  ];

 

  List<Product> get items {
   
    return [..._items];
  }

   List<Product> get favItems {
   
    return _items.where((item) => item.isFavourite == true).toList();
  }


  addProduct() {
   // _items.add(value);
    notifyListeners();
  }

  Product findById(String id) {
        return _items.firstWhere((item) => item.id == id );
  }


}