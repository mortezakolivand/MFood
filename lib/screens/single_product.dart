import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:m_food/models/product.dart';
import 'package:m_food/store/store.dart';
import 'package:provider/provider.dart';

class SingleProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    Product? product = store.activeProduct;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
          actions: [
            Badge(
              showBadge: store.getCartQuantity() > 0,
              position: BadgePosition(top: 0, end: 2),
              animationType: BadgeAnimationType.fade,
              badgeContent: Text(
                store.getCartQuantity().toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black45,
                ),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(store.activeProduct!.name,
              style: TextStyle(color: Colors.black45)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Image(
              image: AssetImage("assets/images/${product?.image}"),
              fit: BoxFit.fitHeight,
              height: 300,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "${product?.price.toStringAsFixed(2)} \$",
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
                Spacer(),
                Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                            offset: Offset(1.0, 1.0))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            iconSize: 30,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                            onPressed: () =>
                                {store.removeItemFromCart(product!)}),
                        Text(
                          product!.quantity.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            iconSize: 30,
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onPressed: () => {store.addItemToCart(product)}),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              product.description,
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ));
  }
}
