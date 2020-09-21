import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products(),),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato'
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx) => ProductDetailScreen(),
          ProductOverviewScreen.routeName : (ctx) => ProductOverviewScreen(),
          CartScreen.routeName : (ctx) => CartScreen(),
        },
      ),
    );
  }
}

