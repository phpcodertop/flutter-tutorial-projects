import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 10,),
                  Chip(
                    label: Text('\$${cart.totalAmount}', style: TextStyle( color: Colors.white),),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(itemBuilder: (ctx, index) {
              var cartItem = cart.items.values.toList()[index];
              return CartItemWidget(cartItem.id, cartItem.price, cartItem.quantity, cartItem.title);
            }, itemCount: cart.itemCount,),
          ),
        ],
      ),
    );
  }
}
