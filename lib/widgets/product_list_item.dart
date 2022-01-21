import 'package:flutter/material.dart';
import 'package:m_food/models/product.dart';
import 'package:m_food/store/store.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/images/${product.image}"),
            width: 100,
            height: 75,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red[500],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          offset: Offset(1.0, 1.0))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 0, 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 13,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "${product.name}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "${product.price.toStringAsFixed(2)} \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart_sharp,
                color: Colors.white,
              ),
              onPressed: () => {store.addItemToCart(product)},
            ),
          )
        ],
      ),
    );
  }
}
