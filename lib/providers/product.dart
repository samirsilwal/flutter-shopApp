import 'package:flutter/material.dart';

class Product extends ChangeNotifier{

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({@required this.id,@required  this.title,@required  this.description,@required  this.price,@required  this.imageUrl, this.isFavourite = false});
  
  void toggleIsFav() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}