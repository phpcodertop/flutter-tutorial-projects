import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, product, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: product.id,
                );
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              leading: IconButton(
                onPressed: () {
                  product.toggleFavouriteStatus();
                },
                icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).accentColor,
              ),
              trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                },
                icon: Icon(Icons.shopping_cart),
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
