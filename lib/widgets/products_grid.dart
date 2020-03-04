import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products..dart';
import 'package:shopapp/widgets/products_item.dart';


class ProductsGrid extends StatelessWidget {

  final bool showFavs;

  const ProductsGrid(this.showFavs);


  

  Widget build(BuildContext context) {

    final productsData  = Provider.of<Products>(context);

    final loadedProducts = showFavs ? productsData.favItems: productsData.items;
    return Container(
      child:GridView.builder(
          padding:const EdgeInsets.all(10.0),
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          ) ,
          itemBuilder: (context, index){
              return ChangeNotifierProvider.value(
                value: loadedProducts[index],
                child: ProductsItem(),
                );
         }
         ),
         
    );
  }
}