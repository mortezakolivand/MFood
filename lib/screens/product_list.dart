import 'package:flutter/material.dart';
import 'package:m_food/store/store.dart';
import 'package:m_food/widgets/product_list_item.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black45,
          ),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/m.png"),
                width: 60,
                height: 55,
              ),
              Text(
                "Food",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Badge(
            showBadge: store.getCartQuantity() > 0,
            position: BadgePosition(top: 0, end: 2),
            animationType: BadgeAnimationType.scale,
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
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended Food",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87)),
                TextButton(
                    onPressed: () => {},
                    child: Text("All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.greenAccent[400]))),
              ],
            ),
          ),
          ...store.products.map((item) {
            return InkWell(
                onTap: () {
                  store.setActiveProduct(item);
                  Navigator.pushNamed(context, '/product');
                },
                child: ProductListItem(product: item));
          }),
        ],
      ),
    );
  }
}
