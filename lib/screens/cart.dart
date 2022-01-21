import 'package:flutter/material.dart';
import 'package:m_food/store/store.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        title: Text('Cart', style: TextStyle(color: Colors.black45)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        ...store.cart.map((item) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage("assets/images/${item.image}"),
                  width: 75,
                  height: 75,
                ),
                Text(
                  "${item.quantity} x ${item.name}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${(item.price * item.quantity).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ));
        }),
        (store.cart.length > 0)
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> _key = GlobalKey();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAction(
                            outerColor: Colors.greenAccent[400],
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            text:
                                "Order ${store.getCartTotal().toStringAsFixed(2)} \$",
                            key: _key,
                            onSubmit: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Process for payment ... ")));
                              Future.delayed(
                                Duration(seconds: 1),
                                () => _key.currentState!.reset(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Container(
                height: 200,
                child: Center(child: Text("Cart is empty.")),
              ),
      ]),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.all(32),
      //           child: _CartList(),
      //         ),
      //       ),
      //       // _CartTotal()
      //     ],
      //   ),
      // ),
    );
  }
}
