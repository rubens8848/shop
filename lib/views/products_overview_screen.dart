import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  FAVORITE,
  ALL,
}

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if(selectedValue == FilterOptions.FAVORITE){
                productsProvider.showFavoriteOnly();
              }else{
                productsProvider.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.FAVORITE,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.ALL,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
