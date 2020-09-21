import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import './cart_screen.dart';
enum FilterOptions {
  Favorite, All
}

class ProductOverviewScreen extends StatefulWidget {
  static const String routeName = 'product-overview';

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if(selectedValue == FilterOptions.Favorite) {
                setState(() {
                  _showOnlyFavorites = true;
                });
              } else {
                setState(() {
                  _showOnlyFavorites = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem( child: Text('Only Favorite'), value: FilterOptions.Favorite,),
              PopupMenuItem( child: Text('Show All'), value: FilterOptions.All,),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, widget) => Badge(
              child: IconButton(icon: Icon(Icons.shopping_cart),onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },),
              value: cart.itemCount.toString(),
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
      drawer: AppDrawer(),
    );
  }
}
