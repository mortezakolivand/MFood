import 'package:flutter/material.dart';
import 'package:m_food/screens/cart.dart';
import 'package:m_food/screens/product_list.dart';
import 'package:m_food/screens/single_product.dart';
import 'package:m_food/screens/user.dart';
import 'package:m_food/store/store.dart';
import 'package:provider/provider.dart';
import 'theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Example',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => UserScreen(),
          '/product': (context) => SingleProductScreen()
        },
      ),
    );
  }
}
