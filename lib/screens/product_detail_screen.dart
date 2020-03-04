import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products..dart';


class ProductDetailScreen  extends StatelessWidget {

  static const routeName = '/product-details';


 

  
  @override
  Widget build(BuildContext context) {
   final productId  =  ModalRoute.of(context).settings.arguments as String;
   final product =  Provider.of<Products>(context, listen: false).findById(productId);

   
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
              child: Padding(
          padding: EdgeInsets.all(8.0),

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
                       Expanded(         
                    child: Card(
                              elevation: 5,
                              child: Image.network( 
                        product.imageUrl,
                        fit:BoxFit.cover,
                        ),
                            ),      
                  ),
              
              SizedBox(
                  height: 15,
              ),

              Card(
                  elevation: 8.0,
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(product.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ), 
                  ) ,
              ),
              Card(
                  
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(product.description), 
                  ) ,
              ),
              Card(
                  
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('\$ ${product.price}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ), 
                  ) ,
              ),
            ],
          ),
                ),
        ),
      ),
    );
  }
}