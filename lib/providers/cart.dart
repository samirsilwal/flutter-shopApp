
import 'package:flutter/foundation.dart';
import 'package:shopapp/widgets/cart_item.dart';

class CartItem {
    final String id;
    final String title;
    double quantity;
    final double price;

  CartItem({@required this.id, @required this.title,  this.quantity = 1, @required this.price}); 

    
}

class Cart with ChangeNotifier{

Map<String, CartItem> _items = {};


Map<String, CartItem> get items {
  return {..._items};
}


double get totalAmount {
  var total = 0.0;
  _items.forEach((key, item){
    total += item.quantity * item.price;
  });
  return total;
}
void addNewItemToCart(String productID, String title, double price) {
      if(_items.containsKey(productID)) {
          _items.update(productID, (oldItem) => CartItem(id: oldItem.id, title: oldItem.title, price: oldItem.price, quantity: oldItem.quantity + 1));
      }else {
        _items.putIfAbsent(productID,() => CartItem(id: DateTime.now().toString(), title: title, price: price));
      }
      notifyListeners();
}

int get getItemsCount{
  return  _items.length;
}

void removeItem(remId) {
  _items.removeWhere((id, item) {
    return item.id  == remId;
  });
  notifyListeners();
}


void remove() {
  _items ={};
  notifyListeners();  
}

void removeSingleItem(String productId) {
  if(!_items.containsKey(productId)){
    return;
  }
    if(_items[productId].quantity > 1) {
      _items.update(productId, (olditem) => CartItem(id:olditem.id, title: olditem.title, quantity: olditem.quantity - 1, price: olditem.price));
    }else {
      _items.remove(productId);
    }

  notifyListeners();  
}

}